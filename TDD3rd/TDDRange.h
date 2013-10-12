//
//  TDDRange.h
//  TDD3rd
//
//  Created by Hidetoshi Mori on 2013/10/12.
//  Copyright (c) 2013年 Hidetoshi Mori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDDRange : NSObject

@property (readonly, nonatomic) NSInteger lowerEndpoint;
@property (readonly, nonatomic) NSInteger upperEndpoint;

- (id)initWithLowerEndpoint:(NSInteger)lowerEndpoint upperEndpoint:(NSInteger)upperEndpoint;
- (BOOL)isEquals:(TDDRange *)range;

@end
