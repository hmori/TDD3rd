//
//  TDDClosedRange.m
//  TDD3rd
//
//  Created by Hidetoshi Mori on 2013/10/12.
//  Copyright (c) 2013年 Hidetoshi Mori. All rights reserved.
//

#import "TDDClosedRange.h"

@implementation TDDClosedRange

- (id)initWithLowerEndpoint:(NSInteger)lowerEndpoint upperEndpoint:(NSInteger)upperEndpoint
{
    if (upperEndpoint < lowerEndpoint) {
        [NSException raise:@"OutOfRangeException" format:@"下端と上端が逆"];
    }
    self = [super initWithLowerEndpoint:lowerEndpoint upperEndpoint:upperEndpoint];
    return self;
}

- (NSString *)string
{
    return [NSString stringWithFormat:@"[%d,%d]", self.lowerEndpoint, self.upperEndpoint];
}

- (BOOL)isContains:(NSInteger)number
{
    return (self.lowerEndpoint <= number && number <= self.upperEndpoint);
}

- (BOOL)isConnectedTo:(TDDClosedRange *)range
{
    return (self.lowerEndpoint <= range.upperEndpoint && range.lowerEndpoint <= self.upperEndpoint);
}

@end
