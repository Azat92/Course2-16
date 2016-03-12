//
//  ViewController.m
//  Lesson16
//
//  Created by Эдуард Рязапов on 02.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "ViewController.h"
#import <StringHelper/RichText.h>
#import <StringHelper/MutableRichText.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RichText *richText = [RichText textWithString:@"richText"];
    richText.bgcolor = [UIColor redColor];
    richText.fgcolor = [UIColor greenColor];
    richText.font = [UIFont systemFontOfSize:50];
    richText.underline = NSUnderlineStyleDouble;
    MutableRichText *mutableRichText = [MutableRichText textWithString:@"mutableRichText"];
    [mutableRichText appendText:richText];
    self.label.attributedText = mutableRichText.attributedString;
}

@end
