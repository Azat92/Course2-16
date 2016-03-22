//
//  RichText.m
//  Lesson16
//
//  Created by Эдуард Рязапов on 02.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "RichText.h"

@interface RichText()

@property (strong, nonatomic) NSMutableAttributedString *tempString;

@end

@implementation RichText

+ (instancetype)textWithString:(NSString *)string {
    return [[self alloc] initWithString:string];
}

- (instancetype)initWithString:(NSString *)string {
    self = [super init];
    if (self)
        _tempString = [[NSMutableAttributedString alloc] initWithString:string];
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    RichText *richText = [[[self class] allocWithZone:zone] init];
    if(richText) {
        richText.fgcolor = self.fgcolor.copy;
        richText.bgcolor = self.bgcolor.copy;
        richText.underline = self.underline;
        richText.font = self.font.copy;
        richText.tempString = self.tempString.copy;
    }
    return richText;
}

- (RichText *)textAtRange:(NSRange)range {
    RichText *tempRichText = self.copy;
    tempRichText.tempString = [[NSMutableAttributedString alloc] initWithAttributedString:[tempRichText.tempString attributedSubstringFromRange:range]];
    return tempRichText;
}

- (NSString *)pureString {
    return self.tempString.string;
}

- (NSAttributedString *)attributedString {
    return self.tempString.copy;
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

- (void)setUnderline:(NSUnderlineStyle)underline {
    _underline = underline;
    [self.tempString  addAttribute:NSUnderlineStyleAttributeName value:@(underline) range:NSMakeRange(0, self.tempString.length)];
}

@end
