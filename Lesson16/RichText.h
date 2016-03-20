//
//  RichText.h
//  Lesson16
//
//  Created by Azat Almeev on 02.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface RichText : NSObject //KVO compatible
- (id)initWithString:(NSString *)string;
- (RichText *)textAtRange:(NSRange)range;
@property (nonatomic, strong) UIColor *fgcolor;
@property (nonatomic, strong) UIColor *bgcolor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic) NSUnderlineStyle underline;
@property (nonatomic) NSInteger length;

@property (nonatomic, readonly) NSString *pureString;
@property (nonatomic, readonly) NSAttributedString *attributedString;
@end
