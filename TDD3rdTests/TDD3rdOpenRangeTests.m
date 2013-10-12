//
//  TDD3rdOpenRangeTests.m
//  TDD3rd
//
//  Created by Hidetoshi Mori on 2013/10/12.
//  Copyright (c) 2013年 Hidetoshi Mori. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TDDOpenRange.h"

@interface TDD3rdOpenRangeTests : XCTestCase

@end

@implementation TDD3rdOpenRangeTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

# pragma mark -
# pragma mark 正常系テスト
# pragma mark Open range 3 to 8

- (void)testO3to8
{
    TDDOpenRange *r = [[TDDOpenRange alloc] initWithLowerEndpoint:3 upperEndpoint:8];

    //下端点と上端点を与えて開区間を生成しよう
    //開区間の下端点と上端点を取得しよう
    //開区間の文字列表記を取得しよう
    XCTAssertEqual(r.lowerEndpoint, 3, @"lowerEndpoint is not 3.");
    XCTAssertEqual(r.upperEndpoint, 8, @"lowerEndpoint is not 8.");
    XCTAssertEqualObjects(r.string, @"(3,8)", @"string is not (3,8).");
    
    
    //開区間が指定した整数を含むか (contains) 判定しよう
    XCTAssertEqual([r isContains:5], YES, @"5 is not Contains.");
    XCTAssertEqual([r isContains:4], YES, @"4 is not Contains.");
    XCTAssertEqual([r isContains:7], YES, @"7 is not Contains.");
    XCTAssertEqual([r isContains:3], NO, @"3 Contains.");
    XCTAssertEqual([r isContains:8], NO, @"8 Contains.");

    
    
    //開区間が別の開区間と等しいか (equals) 判定しよう
    //開区間が別の開区間と接続しているか (isConnectedTo) 判定しよう
    
    // (3,8) は (3,8) と等しい
    XCTAssertEqual([r isEquals:[[TDDOpenRange alloc] initWithLowerEndpoint:3 upperEndpoint:8]], YES, @"TDDOpenRange(3,8) is not equals.");
    
    // (3,8) は (1,6) と等しくない
    XCTAssertEqual([r isEquals:[[TDDOpenRange alloc] initWithLowerEndpoint:1 upperEndpoint:6]], NO, @"TDDOpenRange(1,6) is equals.");
    XCTAssertEqual([r isEquals:[[TDDOpenRange alloc] initWithLowerEndpoint:3 upperEndpoint:6]], NO, @"TDDOpenRange(1,6) is equals.");
    XCTAssertEqual([r isEquals:[[TDDOpenRange alloc] initWithLowerEndpoint:1 upperEndpoint:8]], NO, @"TDDOpenRange(1,6) is equals.");
    
    // (3,8) は (1,6) と接続している
    XCTAssertEqual([r isConnectedTo:[[TDDOpenRange alloc] initWithLowerEndpoint:1 upperEndpoint:6]], YES, @"TDDOpenRange(1,6) is not Connected.");
    
    // (3,8) は (8,15) と接続している
    XCTAssertEqual([r isConnectedTo:[[TDDOpenRange alloc] initWithLowerEndpoint:8 upperEndpoint:15]], NO, @"TDDOpenRange(8,15) is Connected.");
    XCTAssertEqual([r isConnectedTo:[[TDDOpenRange alloc] initWithLowerEndpoint:7 upperEndpoint:15]], YES, @"TDDOpenRange(7,15) is not Connected.");
    XCTAssertEqual([r isConnectedTo:[[TDDOpenRange alloc] initWithLowerEndpoint:1 upperEndpoint:3]], NO, @"TDDOpenRange(1,3) is Connected.");
    XCTAssertEqual([r isConnectedTo:[[TDDOpenRange alloc] initWithLowerEndpoint:1 upperEndpoint:4]], YES, @"TDDOpenRange(1,4) is not Connected.");
    
    // (3,8) と (9,12) は接続していない
    XCTAssertEqual([r isConnectedTo:[[TDDOpenRange alloc] initWithLowerEndpoint:9 upperEndpoint:12]], NO, @"TDDOpenRange(9,12) is Connected.");

}

# pragma mark -
# pragma mark 異常系テスト

- (void)testOutOfRange {
    
    //レンジ外となる場合
    XCTAssertThrows([[TDDOpenRange alloc] initWithLowerEndpoint:8 upperEndpoint:3], @"no Throws for out of range.");
    XCTAssertThrows([[TDDOpenRange alloc] initWithLowerEndpoint:3 upperEndpoint:3], @"no Throws for out of range.");
    
    //レンジ範囲内の場合
    XCTAssertNoThrow([[TDDOpenRange alloc] initWithLowerEndpoint:3 upperEndpoint:4], @"Throws for out of range.");
}


@end
