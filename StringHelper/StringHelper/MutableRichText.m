//
//  MutableRichText.m
//  Lesson16
//
//  Created by Эдуард Рязапов on 02.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MutableRichText.h"

@interface RichText()

@property (strong, nonatomic) NSMutableAttributedString *tempString;

@end

@implementation MutableRichText

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
    [super.tempString deleteCharactersInRange:range];
}

- (void)replaceWithText:(RichText *)text atRange:(NSRange)range {
    [super.tempString replaceCharactersInRange:range withAttributedString:text.attributedString];
}

@end
