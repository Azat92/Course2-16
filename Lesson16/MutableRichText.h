//
//  MutableRichText.h
//  Lesson16
//
//  Created by Эдуард Рязапов on 02.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RichText.h"

@interface MutableRichText : RichText

+ (instancetype)mutableTextWithText:(NSString *)richText;

- (void)appendText:(RichText *)text;
- (void)prependText:(RichText *)text;
- (void)insertText:(RichText *)text atIndex:(NSInteger)index;
- (void)removeTextAtRange:(NSRange)range;
- (void)replaceWithText:(RichText *)text atRange:(NSRange)range;

@end
