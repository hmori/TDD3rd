//
//  TDDClosedRange.h
//  TDD3rd
//
//  Created by Hidetoshi Mori on 2013/10/12.
//  Copyright (c) 2013年 Hidetoshi Mori. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDDRange.h"

@interface TDDClosedRange : TDDRange

- (id)initWithLowerEndpoint:(NSInteger)lowerEndpoint upperEndpoint:(NSInteger)upperEndpoint;
- (NSString *)string;
- (BOOL)isContains:(NSInteger)number;
- (BOOL)isConnectedTo:(TDDClosedRange *)range;

@end
