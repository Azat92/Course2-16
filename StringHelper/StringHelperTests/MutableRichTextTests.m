//
//  MutableRichTextTests.m
//  StringHelper
//
//  Created by Эдуард Рязапов on 12.03.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MutableRichText.h"

@interface MutableRichTextTests : XCTestCase

@property MutableRichText *mutableRichText;

@end

@implementation MutableRichTextTests

- (void)setUp {
    [super setUp];
    self.mutableRichText = [MutableRichText textWithString:@"test text"];
}

- (void)testMutableRichTextAppendText {
    [self.mutableRichText appendText:[RichText textWithString:@" + append text"]];
    XCTAssertTrue([self.mutableRichText.pureString isEqualToString:@"test text + append text"]);
}

- (void)testMutableRichTextPrependText {
    [self.mutableRichText prependText:[RichText textWithString:@"prepend text + "]];
    XCTAssertTrue([self.mutableRichText.pureString isEqualToString:@"prepend text + test text"]);
}

- (void)testMutableRichTextInsertText {
    [self.mutableRichText insertText:[RichText textWithString:@"+ insert text + "] atIndex:5];
    XCTAssertTrue([self.mutableRichText.pureString isEqualToString:@"test + insert text + text"]);

}

- (void)testMutableRichTextRemoveTextAtRange {
    [self.mutableRichText removeTextAtRange:NSMakeRange(2, 5)];
    XCTAssertTrue([self.mutableRichText.pureString isEqualToString:@"text"]);
}

- (void)testMutableRichTextReplaceWithText {
    [self.mutableRichText replaceWithText:[RichText textWithString:@"new text"] atRange:NSMakeRange(5, 4)];
    XCTAssertTrue([self.mutableRichText.pureString isEqualToString:@"test new text"]);
}

@end
