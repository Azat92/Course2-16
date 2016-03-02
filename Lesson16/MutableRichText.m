//
//  MutableRichText.m
//  Lesson16
//
//  Created by Эдуард Рязапов on 02.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MutableRichText.h"

@interface RichText()

@property NSMutableAttributedString *tempString;

@end

@implementation MutableRichText

+ (instancetype)mutableTextWithText:(NSString *)text {
    MutableRichText *mutableText = [MutableRichText new];
    mutableText.tempString = [[NSMutableAttributedString alloc] initWithString:text];
    return mutableText;
}

- (void)appendText:(RichText *)text {
    [super.tempString appendAttributedString:text.attributedString];
}

- (void)prependText:(RichText *)text {
    NSMutableAttributedString *tmp = [[NSMutableAttributedString alloc] initWithAttributedString:text.attributedString];
    [tmp appendAttributedString:self.tempString];
    super.tempString = tmp;
}

- (void)insertText:(RichText *)text atIndex:(NSInteger)index {
    [super.tempString insertAttributedString:text.attributedString atIndex:index];
}

- (void)removeTextAtRange:(NSRange)range {
    [super.tempString replaceCharactersInRange:range withAttributedString:[[NSAttributedString alloc] initWithString:@""]];
}

- (void)replaceWithText:(RichText *)text atRange:(NSRange)range {
    [super.tempString replaceCharactersInRange:range withAttributedString:text.attributedString];
}

@end
