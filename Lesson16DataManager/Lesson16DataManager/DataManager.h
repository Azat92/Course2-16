//
//  DataManager.h
//  Lesson16
//
//  Created by Azat Almeev on 28.02.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@class DataManager;

@protocol DataManagerDelegate <NSObject>

- (UIViewController *)authBaseControllerForDataManager:(DataManager *)manager;

@end

@interface DataManager : NSObject

@property (nonatomic, weak) id <DataManagerDelegate> delegate;
@property (nonatomic, strong) NSArray *items;

+ (instancetype)managerWithUpdateCallback:(void (^)(NSArray *items, NSError *error))onUpdate;
- (void)loadData;

@end
