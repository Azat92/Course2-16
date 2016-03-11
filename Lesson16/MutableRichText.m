//
//  MutableRichText.m
//  Lesson16
//
//  Created by Никита Солдатов on 10.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MutableRichText.h"

@interface MutableRichText()


@property NSMutableAttributedString *atributedString;

@end

@implementation MutableRichText

- (id)initWithString:(NSString *)string {
    self = [super init];
    if (self) {
        self.atributedString = [[NSMutableAttributedString alloc]initWithString:string];
    }
    return self;
}

- (id)init {
    return [self initWithString:nil];
}

- (void)appendText:(RichText *)text {
    [self.atributedString appendAttributedString:[text attributedString]];
}
- (void)prependText:(RichText *)text {
    [self.atributedString insertAttributedString:[text attributedString] atIndex:0];
}
- (void)insertText:(RichText *)text atIndex:(NSInteger)index {
    [self.atributedString insertAttributedString:[text attributedString] atIndex:index];
}
- (void)removeTextAtRange:(NSRange)range {
    [self.atributedString deleteCharactersInRange:range];
}
- (void)replaceWithText:(RichText *)text atRange:(NSRange)range {
    [self.atributedString replaceCharactersInRange:range withAttributedString:[text attributedString]];
}

@end