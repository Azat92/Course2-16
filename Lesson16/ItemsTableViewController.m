//
//  ViewController.m
//  Lesson16
//
//  Created by Azat Almeev on 28.02.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "ItemsTableViewController.h"
#import <Lesson16DataManager/Lesson16DataManager.h>

@interface ItemsTableViewController () <DataManagerDelegate>

@property (nonatomic, readonly) DataManager *manager;

@end

@implementation ItemsTableViewController
@synthesize manager = _manager;

- (DataManager *)manager {
    if (!_manager) {
        __weak typeof(self) self_ = self;
        _manager = [DataManager managerWithUpdateCallback:^(NSArray *items, NSError *error) {
            if (error)
                NSLog(@"%@", error);
            else
                [self_.tableView reloadData];
        }];
        _manager.delegate = self;
    }
    return _manager;
}

- (IBAction)refreshButtonDidClick:(id)sender {
    [self.manager loadData];
}

#pragma mark - Data Manager Delegate
- (UIViewController *)authBaseControllerForDataManager:(DataManager *)manager {
    return self;
}

#pragma mark - Table View Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.manager.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"itemCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSDictionary *object = self.manager.items[indexPath.row];
    cell.textLabel.text = object[@"name"];
    cell.detailTextLabel.text = object[@"description"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
