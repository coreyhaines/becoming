//
//  HasANumberTimesThree.m
//  Becoming
//
//  Created by coreyhaines on 6/8/13.
//  Copyright (c) 2013 coreyhaines. All rights reserved.
//

#import "HasANumberTimesThree.h"
#import "NSObject+CanBecome.h"


@implementation HasANumberTimesThree
-(NSNumber *) number{
    int result = [[self performSelectorAsPreviousType:@selector(number)] intValue] * 3;
    return [NSNumber numberWithInt:result];
}
@end
