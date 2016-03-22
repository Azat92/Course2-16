//
//  RichTextTests.m
//  StringHelper
//
//  Created by Эдуард Рязапов on 11.03.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RichText.h"

@interface RichTextTests : XCTestCase

@property RichText *richText;

@end

@implementation RichTextTests

- (void)setUp {
    [super setUp];
    self.richText = [RichText textWithString:@"test text"];
    self.richText.bgcolor = [UIColor blueColor];
}

- (void)testRichTextSetForegroundColor {
    UIColor *redColor = [UIColor redColor];
    self.richText.fgcolor = redColor;
    UIColor *testColor = [[self.richText.attributedString attributesAtIndex:0 effectiveRange:nil] objectForKey:NSForegroundColorAttributeName];
    XCTAssertEqualObjects(redColor, testColor, @"color - (%@) not equal to testColor(%@))", redColor, testColor);
}

- (void)testRichTextSetBackgroundColor {
    UIColor *redColor = [UIColor redColor];
    self.richText.bgcolor = redColor;
    UIColor *testColor = [[self.richText.attributedString attributesAtIndex:0 effectiveRange:nil] objectForKey:NSBackgroundColorAttributeName];
    XCTAssertEqualObjects(redColor, testColor, @"color - (%@) not equal to testColor(%@))", redColor, testColor);
}

- (void)testRichTextSetFont {
    UIFont *font = [UIFont systemFontOfSize:100];
    self.richText.font = font;
    UIFont *testFont = [[self.richText.attributedString attributesAtIndex:0 effectiveRange:nil] objectForKey:NSFontAttributeName];
    XCTAssertEqualObjects(font, testFont, @"font - (%@) not equal to testFont(%@)", font, testFont);

}

- (void)testRichTextSetUnderlineStyle {
    NSUnderlineStyle underline = NSUnderlineStyleSingle;
    self.richText.underline = underline;
    NSUnderlineStyle testLine = [[[self.richText.attributedString attributesAtIndex:0 effectiveRange:nil] objectForKey:NSUnderlineStyleAttributeName] integerValue];
    XCTAssertEqual(underline, testLine, @"underline - (%ld) not equal to testLine(%ld)", (long)underline, (long)testLine);
}

- (void)testRichTextAtRange {
    RichText *text = [self.richText textAtRange:NSMakeRange(0, 4)];
    NSLog(@"%@", text.pureString);
    XCTAssertTrue([text.pureString isEqualToString:@"test"]);
}

- (void)testRichTextAtRangeAttributes {
    RichText *text = [self.richText textAtRange:NSMakeRange(0, 4)];
    XCTAssertTrue([self.richText.bgcolor isEqual:text.bgcolor]);
}

@end
