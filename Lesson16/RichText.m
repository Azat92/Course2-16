//
//  RichText.m
//  Lesson16
//
//  Created by Azat Almeev on 02.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "RichText.h"

@interface RichText()

@property NSMutableAttributedString *mutableAtributedString;
@end

@implementation RichText

- (id)initWithString:(NSString *)string {
    self = [super init];
    if (self){
        self.mutableAtributedString = [[NSMutableAttributedString alloc] initWithString:string];
    }
    return self;
}

-(id)init{
    return [self initWithString:nil];
}

- (RichText *)textAtRange:(NSRange)range {
    self.mutableAtributedString = [[NSMutableAttributedString alloc] initWithAttributedString:[self.mutableAtributedString attributedSubstringFromRange:range]];
    return self;
}

- (void)setBgcolor:(UIColor *)bgcolor {
    _bgcolor = bgcolor;
    [self.mutableAtributedString addAttribute:NSBackgroundColorAttributeName value:bgcolor range:NSMakeRange(0, self.length)];
}

- (void)setFgcolor:(UIColor *)fgcolor {
    _fgcolor = fgcolor;
    [self.mutableAtributedString addAttribute:NSForegroundColorAttributeName value:fgcolor range:NSMakeRange(0, self.length)];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    [self.mutableAtributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
}

- (void)setUnderline:(NSUnderlineStyle)underline {
    _underline = underline;
    NSNumber *underLineNumber = [NSNumber numberWithInteger:underline];
    [self.mutableAtributedString addAttribute:NSUnderlineStyleAttributeName value:underLineNumber range:NSMakeRange(0, self.length)];
}

- (NSInteger)length {
    return self.mutableAtributedString.length;
}



- (NSString *)pureString {
    return self.mutableAtributedString.string;
}

- (NSAttributedString *)attributedString {
    return [self.mutableAtributedString attributedSubstringFromRange:NSMakeRange(0, self.length)];
}

@end
