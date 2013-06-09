//
//  HasSelectorFoo.m
//  Becoming
//
//  Created by coreyhaines on 6/8/13.
//  Copyright (c) 2013 coreyhaines. All rights reserved.
//

#import "HasSelectorFoo.h"

@implementation HasSelectorFoo
- (NSString *) tellMe
{
    return @"Foo";
}
- (void) become:(Class)thisClass
{
    isa = thisClass;
}
@end
