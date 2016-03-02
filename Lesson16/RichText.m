//
//  RichText.m
//  Lesson16
//
//  Created by Эдуард Рязапов on 02.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "RichText.h"

@interface RichText()

@property NSMutableAttributedString *tempString;

@end

@implementation RichText

+ (instancetype)textWithString:(NSString *)string {
    RichText *richText = [RichText new];
    richText.tempString = [[NSMutableAttributedString alloc] initWithString:string];
    return richText;
}

- (RichText *)textAtRange:(NSRange)range {
    self.tempString = [[NSMutableAttributedString alloc] initWithAttributedString:[self.tempString attributedSubstringFromRange:range]];
    return self;
}

- (NSString *)pureString {
    return self.tempString.string;
}

- (NSAttributedString *)attributedString {
    return self.tempString;
}

- (void)setFgcolor:(UIColor *)fgcolor {
    _fgcolor = fgcolor;
    [self.tempString addAttribute:NSForegroundColorAttributeName value:fgcolor range:NSMakeRange(0, self.tempString.length)];
}

- (void)setBgcolor:(UIColor *)bgcolor {
    _bgcolor = bgcolor;
    [self.tempString addAttribute:NSBackgroundColorAttributeName value:bgcolor range:NSMakeRange(0, self.tempString.length)];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    [self.tempString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.tempString.length)];
}

- (void)setUnderline:(NSUnderlineStyle *)underline {
    _underline = underline;
    [self.tempString  addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:(NSInteger)underline]range:NSMakeRange(0, self.tempString.length)];
}

@end
