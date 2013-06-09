//
//  HasANumberTimesThree.m
//  Becoming
//
//  Created by coreyhaines on 6/8/13.
//  Copyright (c) 2013 coreyhaines. All rights reserved.
//

#import "HasANumberTimesThree.h"

@implementation HasANumberTimesThree
-(NSNumber *) number{
    int result = [[super performSelectorAsPreviousType:@selector(number)] intValue] * 3;
    return [NSNumber numberWithInt:result];
}
@end
