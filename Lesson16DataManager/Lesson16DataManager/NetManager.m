//
//  NetManager.m
//  Lesson16
//
//  Created by Azat Almeev on 28.02.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager

+ (instancetype)sharedInstance {
    static id _singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[self alloc] initSingleton];
    });
    return _singleton;
}

- (id)init {
    @throw [NSException exceptionWithName:@"You could not create an instance of this class" reason:@"This class is designed under the singleton pattern" userInfo:nil];
}

- (instancetype)initSingleton {
    self = [super init];
    if (!self)
        return nil;
    return self;
}


- (void)authWithLogin:(NSString *)login andPassword:(NSString *)password completion:(void (^)(NSError *error))completion {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((1 + arc4random_uniform(3)) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([login isEqualToString:@"login"] && [password isEqualToString:@"password"])
            completion(nil);
        else
            completion([NSError errorWithDomain:@"network" code:401 userInfo:@{ NSLocalizedDescriptionKey : @"Invalid username or password" }]);
    });
}

@end
