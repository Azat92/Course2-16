//
//  RichText.m
//  Lesson16
//
//  Created by Azat Almeev on 02.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "RichText.h"

@implementation RichText

- (void)testWithLabel:(UILabel *)label {
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"Test String" attributes:@{ NSForegroundColorAttributeName : [UIColor redColor], NSBackgroundColorAttributeName : [UIColor greenColor], NSFontAttributeName : [UIFont systemFontOfSize:17] }];
    NSMutableAttributedString *mutable = [[NSMutableAttributedString alloc] initWithAttributedString:attrString];
    NSAttributedString *insertString = [[NSAttributedString alloc] initWithString:@" Insert " attributes:@{ NSForegroundColorAttributeName : [UIColor yellowColor], NSBackgroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont systemFontOfSize:20], NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle) }];
    [mutable insertAttributedString:insertString atIndex:5];
    label.attributedText = mutable;
}
+ (instancetype)textWithString:(NSString *)string{
    RichText *text = [RichText new];
    text.atrString = [[NSMutableAttributedString alloc] initWithString:string];
    return  text;
}
- (RichText *)textAtRange:(NSRange)range{
    NSAttributedString *textAtRange = [[NSAttributedString alloc] initWithAttributedString:self.atrString];
    textAtRange = [self.atrString attributedSubstringFromRange:range ];
    return [RichText textWithString:textAtRange.string];
}




@end
