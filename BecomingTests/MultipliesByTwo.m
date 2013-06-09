//
//  MultipliesByTwo.m
//  Becoming
//
//  Created by coreyhaines on 6/8/13.
//  Copyright (c) 2013 coreyhaines. All rights reserved.
//

#import "MultipliesByTwo.h"
#import "NSObject+CanBecome.h"


@implementation MultipliesByTwo
- (NSNumber *) newNumber
{
    int result = [[self performSelectorAsPreviousType: @selector(number)] intValue] * 2;
    return [NSNumber numberWithInt:result];
}
@end
