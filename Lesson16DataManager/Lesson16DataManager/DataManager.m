//
//  DataManager.m
//  Lesson16
//
//  Created by Azat Almeev on 28.02.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "DataManager.h"
#import "NetManager.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface DataManager ()

@property (nonatomic, copy) void (^updateCallback)(NSArray *items, NSError *error);
@property (nonatomic) BOOL didAuth;



@end

@implementation DataManager


+ (instancetype)managerWithUpdateCallback:(void (^)(NSArray *items, NSError *error))onUpdate {
    DataManager *manager = [[DataManager alloc] init];
  
    if (!manager.cachesDirectory){
        
        manager.paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        manager.cachesDirectory = [manager.paths objectAtIndex:0];
        manager.cachesDirectory = [manager.cachesDirectory stringByAppendingPathComponent:@"MyAppCache"];
   
    }
    manager.updateCallback = onUpdate;
    manager.cache = [NSKeyedUnarchiver unarchiveObjectWithFile:manager.cachesDirectory];
    return manager;
}


- (void)planNextAuth {
    [self performSelector:@selector(setNoAuth) withObject:nil afterDelay:1 * 60];
}

- (void)setNoAuth {
    self.didAuth = NO;
}

- (void)checkAuthCompletion:(void (^)(NSError *error))completion usingHUD:(MBProgressHUD *)hud {
    if (self.didAuth)
        completion(nil);
    else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Auth required" message:@"Please enter username and password" preferredStyle:UIAlertControllerStyleAlert];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"Username";
            textField.autocorrectionType = UITextAutocorrectionTypeNo;
            textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
            textField.spellCheckingType = UITextSpellCheckingTypeNo;
            textField.returnKeyType = UIReturnKeyNext;
        }];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"Password";
            textField.autocorrectionType = UITextAutocorrectionTypeNo;
            textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
            textField.spellCheckingType = UITextSpellCheckingTypeNo;
            textField.secureTextEntry = YES;
            textField.returnKeyType = UIReturnKeyDone;
        }];
        __weak UIAlertController *alert_ = alert;
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [hud showAnimated:YES];
            hud.removeFromSuperViewOnHide = YES;
            [[NetManager sharedInstance] authWithLogin:alert_.textFields[0].text andPassword:alert_.textFields[1].text completion:^(NSError *error) {
                self.didAuth = error == nil;
                [self planNextAuth];
                completion(error);
            }];
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [hud showAnimated:YES];
            hud.removeFromSuperViewOnHide = YES;
            completion([NSError errorWithDomain:@"world" code:401 userInfo:@{ NSLocalizedDescriptionKey : @"Authorization was cancelled by user" }]);
        }]];
        hud.removeFromSuperViewOnHide = NO;
        [hud hideAnimated:YES];
        [[self.delegate authBaseControllerForDataManager:self] presentViewController:alert animated:YES completion:nil];
    }
}

- (void)loadData {
    UIViewController *controller = [self.delegate authBaseControllerForDataManager:self];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:controller.view.window animated:YES];
    [self checkAuthCompletion:^(NSError *error) {
        if (error) {
            self.updateCallback(nil, error);
            hud.mode = MBProgressHUDModeText;
            hud.label.text = @"Error loading data";
            hud.detailsLabel.text = error.localizedDescription;
            [hud hideAnimated:YES afterDelay:3];
        }
        else
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((1 + arc4random_uniform(3)) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSMutableArray *someItems = [NSMutableArray new];
                for (NSInteger i = 0; i < 100; i++) {
                    NSMutableDictionary *object = [NSMutableDictionary new];
                    object[@"uid"] = @(i);
                    object[@"name"] = [NSString stringWithFormat:@"Object name %@", @(i)];
                    object[@"description"] = [NSString stringWithFormat:@"Object updated %@", [NSDate new]];
                    [someItems addObject:object];
                  
                    
                }
                self.cache = [someItems copy];
                [NSKeyedArchiver archiveRootObject:self.cache toFile:self.cachesDirectory];
                self.updateCallback(self.cache, nil);
                [hud hideAnimated:YES];
            });
    } usingHUD:hud];
}

@end
