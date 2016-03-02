//
//  ViewController.m
//  Lesson16
//
//  Created by Эдуард Рязапов on 02.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "ViewController.h"
#import "RichText.h"
#import "MutableRichText.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RichText *text = [RichText textWithString:@"text"];
    text.bgcolor = [UIColor redColor];
    text.fgcolor = [UIColor greenColor];
    text.font = [UIFont systemFontOfSize:100];
    text.underline = NSUnderlineStyleDouble;
    text = [text textAtRange:NSMakeRange(0, 2)];
    MutableRichText *mutableText = [MutableRichText mutableTextWithText:@"123"];
    [mutableText replaceWithText:text atRange:NSMakeRange(1, 2)];
    self.label.attributedText = mutableText.attributedString;
}

@end
