//
//  MyViewController.m
//  Lesson16
//
//  Created by Мария Тимофеева on 14.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MyViewController.h"
#import <RichTextLibr/RichText.h>

@implementation MyViewController

-(void)viewDidLoad{

    RichText *text = [RichText textWithString:@"are you"];
    MutableRichText *text2 = [MutableRichText new];
    text2.atrString = [[NSMutableAttributedString alloc] initWithString:@"User, "] ;
    [text2 appendText:text];
    [text2 insertText:[RichText textWithString:@"how"] atIndex:5];
    [text2 replaceWithText:[RichText textWithString:@"Girl"]atRange:NSMakeRange(0, 4)];
    [text2 removeTextAtRange:NSMakeRange(0, 5)];
    self.label.attributedText = text2.atrString;
}
@end
