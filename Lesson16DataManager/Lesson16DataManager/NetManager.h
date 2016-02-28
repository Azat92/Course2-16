//
//  NetManager.h
//  Lesson16
//
//  Created by Azat Almeev on 28.02.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetManager : NSObject

+ (instancetype)sharedInstance;
- (void)authWithLogin:(NSString *)login andPassword:(NSString *)password completion:(void (^)(NSError *error))completion;

@end
