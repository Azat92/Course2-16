//
//  MutableRichText.m
//  Lesson16
//
//  Created by Мария Тимофеева on 15.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "RichText.h"

@implementation MutableRichText

- (void)appendText:(RichText *)text{
    [self.atrString appendAttributedString:text.atrString];
}
- (void)prependText:(RichText *)text{
    self.atrString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@", text.atrString.string, self.atrString.string]];
}
- (void)insertText:(RichText *)text atIndex:(NSInteger)index{
    
    [self.atrString insertAttributedString:text.atrString atIndex:index];
    
}
- (void)removeTextAtRange:(NSRange)range{
    [self.atrString replaceCharactersInRange:range withAttributedString:[[NSAttributedString alloc] initWithString:@""]];
}
- (void)replaceWithText:(RichText *)text atRange:(NSRange)range{
    [self.atrString replaceCharactersInRange:range withString:text.atrString.string];
}
@end
