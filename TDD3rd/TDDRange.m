//
//  TDDRange.m
//  TDD3rd
//
//  Created by Hidetoshi Mori on 2013/10/12.
//  Copyright (c) 2013年 Hidetoshi Mori. All rights reserved.
//

#import "TDDRange.h"

@implementation TDDRange

- (id)initWithLowerEndpoint:(NSInteger)lowerEndpoint upperEndpoint:(NSInteger)upperEndpoint
{
    self = [super init];
    if (self) {
        _lowerEndpoint = lowerEndpoint;
        _upperEndpoint = upperEndpoint;
    }
    return self;
}


- (BOOL)isEquals:(TDDRange *)range
{
    return (range.lowerEndpoint == _lowerEndpoint && range.upperEndpoint == _upperEndpoint);
}


@end
