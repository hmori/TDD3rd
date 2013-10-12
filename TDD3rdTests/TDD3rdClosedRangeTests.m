//
//  TDD3rdClosedRangeTests.m
//  TDD3rdTests
//
//  Created by Hidetoshi Mori on 2013/10/12.
//  Copyright (c) 2013年 Hidetoshi Mori. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TDDClosedRange.h"

@interface TDD3rdClosedRangeTests : XCTestCase

@end

@implementation TDD3rdClosedRangeTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

# pragma mark -
# pragma mark 正常系テスト
# pragma mark Closed range 3 to 8

- (void)testC3to8
{
    //下端点と上端点を与えて閉区間を生成しよう
    //閉区間から下端点と上端点を取得しよう
    //閉区間から文字列表記を取得しよう
    
    TDDClosedRange *r = [[TDDClosedRange alloc] initWithLowerEndpoint:3 upperEndpoint:8];
    XCTAssertEqual(r.lowerEndpoint, 3, @"lowerEndpoint is not 3.");
    XCTAssertEqual(r.upperEndpoint, 8, @"lowerEndpoint is not 8.");
    XCTAssertEqualObjects(r.string, @"[3,8]", @"string is not [3,8].");

    //閉区間が指定した整数を含むか (contains) 判定しよう
    XCTAssertEqual([r isContains:5], YES, @"5 Contains.");
    XCTAssertEqual([r isContains:3], YES, @"3 Contains.");
    XCTAssertEqual([r isContains:8], YES, @"8 Contains.");
    XCTAssertEqual([r isContains:-1], NO, @"-1 not Contains.");
    
    //閉区間が別の閉区間と等しいか (equals) 判定しよう
    //閉区間が別の閉区間と接続しているか (isConnectedTo) 判定しよう

    // [3,8] は [3,8] と等しい
    XCTAssertEqual([r isEquals:[[TDDClosedRange alloc] initWithLowerEndpoint:3 upperEndpoint:8]], YES, @"TDDClosedRange(3,8) is not equals.");
    
    // [3,8] は [1,6] と等しくない
    XCTAssertEqual([r isEquals:[[TDDClosedRange alloc] initWithLowerEndpoint:1 upperEndpoint:6]], NO, @"TDDClosedRange(1,6) is equals.");
    XCTAssertEqual([r isEquals:[[TDDClosedRange alloc] initWithLowerEndpoint:3 upperEndpoint:6]], NO, @"TDDClosedRange(1,6) is equals.");
    XCTAssertEqual([r isEquals:[[TDDClosedRange alloc] initWithLowerEndpoint:1 upperEndpoint:8]], NO, @"TDDClosedRange(1,6) is equals.");

    // [3,8] は [1,6] と接続している
    XCTAssertEqual([r isConnectedTo:[[TDDClosedRange alloc] initWithLowerEndpoint:1 upperEndpoint:6]], YES, @"TDDClosedRange(1,6) is not Connected.");

    // [3,8] は [8,15] と接続している
    XCTAssertEqual([r isConnectedTo:[[TDDClosedRange alloc] initWithLowerEndpoint:8 upperEndpoint:15]], YES, @"TDDClosedRange(8,15) is not Connected.");
    XCTAssertEqual([r isConnectedTo:[[TDDClosedRange alloc] initWithLowerEndpoint:8 upperEndpoint:10]], YES, @"TDDClosedRange(1,6) is not Connected.");
    XCTAssertEqual([r isConnectedTo:[[TDDClosedRange alloc] initWithLowerEndpoint:9 upperEndpoint:10]], NO, @"TDDClosedRange(1,6) is not Connected.");
    XCTAssertEqual([r isConnectedTo:[[TDDClosedRange alloc] initWithLowerEndpoint:1 upperEndpoint:3]], YES, @"TDDClosedRange(1,6) is not Connected.");
    XCTAssertEqual([r isConnectedTo:[[TDDClosedRange alloc] initWithLowerEndpoint:1 upperEndpoint:2]], NO, @"TDDClosedRange(1,6) is not Connected.");

    // [3,8] と [9,12] は接続していない
    XCTAssertEqual([r isConnectedTo:[[TDDClosedRange alloc] initWithLowerEndpoint:9 upperEndpoint:12]], NO, @"TDDClosedRange(9,12) is Connected.");

    
}

# pragma mark Closed range 4 to 9

- (void)testC4to9
{
    //下端点と上端点を与えて閉区間を生成しよう
    //閉区間から下端点と上端点を取得しよう
    //閉区間から文字列表記を取得しよう
    
    TDDClosedRange *r = [[TDDClosedRange alloc] initWithLowerEndpoint:4 upperEndpoint:9];
    XCTAssertEqual(r.lowerEndpoint, 4, @"lowerEndpoint is not 4.");
    XCTAssertEqual(r.upperEndpoint, 9, @"lowerEndpoint is not 9.");
    XCTAssertEqualObjects(r.string, @"[4,9]", @"string is not [4,9].");
}

# pragma mark -
# pragma mark 異常系テスト

- (void)testOutOfRange {
    
    //レンジ外となる場合
    XCTAssertThrows([[TDDClosedRange alloc] initWithLowerEndpoint:8 upperEndpoint:3], @"no Throws for out of range.");
    
    //レンジ範囲内の場合
    XCTAssertNoThrow([[TDDClosedRange alloc] initWithLowerEndpoint:3 upperEndpoint:3], @"Throws for out of range.");
}

@end
