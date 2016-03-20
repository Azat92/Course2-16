//
//  TestViewController.m
//  Lesson16
//
//  Created by Никита Солдатов on 11.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "TestViewController.h"
#import "RichText.h"
#import "MutableRichText.h"

@interface TestViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RichText *text = [[RichText alloc] initWithString:@"test"];
    text.bgcolor = [UIColor redColor];
    text.fgcolor = [UIColor blueColor];
    text.font = [UIFont systemFontOfSize:30];
    MutableRichText *mutableText = [[MutableRichText alloc] initWithString:@"testMutable"];
    [mutableText prependText:text];
    [mutableText removeTextAtRange:NSMakeRange(1, 2)];
    [mutableText replaceWithText:text atRange:NSMakeRange(1, 4)];
    
    self.testLabel.attributedText = mutableText.attributedString;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
