//
//  MutableRichText.m
//  Lesson16
//
//  Created by Никита Солдатов on 10.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MutableRichText.h"

@interface MutableRichText()


@property NSMutableAttributedString *mutableAtributedString;

@end

@implementation MutableRichText

- (id)initWithString:(NSString *)string {
    self = [super initWithString:string];
    if (self) {
        self.mutableAtributedString = [[NSMutableAttributedString alloc]initWithString:string];
    }
    return self;
}

- (id)init {
    return [self initWithString:nil];
}

- (void)appendText:(RichText *)text {
    [self.mutableAtributedString appendAttributedString:[text attributedString]];
}
- (void)prependText:(RichText *)text {
    [self.mutableAtributedString insertAttributedString:[text attributedString] atIndex:0];
}
- (void)insertText:(RichText *)text atIndex:(NSInteger)index {
    [self.mutableAtributedString insertAttributedString:[text attributedString] atIndex:index];
}
- (void)removeTextAtRange:(NSRange)range {
    [self.mutableAtributedString deleteCharactersInRange:range];
}
- (void)replaceWithText:(RichText *)text atRange:(NSRange)range {
    [self.mutableAtributedString replaceCharactersInRange:range withAttributedString:[text attributedString]];
}



@end