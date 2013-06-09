//
//  Becoming.m
//  Becoming
//
//  Created by coreyhaines on 6/8/13.
//  Copyright (c) 2013 coreyhaines. All rights reserved.
//

#import "Becoming.h"

@interface Becoming()
{
    id _previousType;
}
@end

@implementation Becoming
- (void) become:(Class)thisClass
{
    _previousType = isa;
    isa = thisClass;
}
- (void) unbecome
{
    isa = _previousType;
//    _previousType = nil;
}

- (id) performSelectorAsPreviousType:(SEL)selector
{
    id currentType = isa;
    isa = _previousType;
    id val = [self performSelector:selector];
    isa = currentType;
    return val;
}
@end
