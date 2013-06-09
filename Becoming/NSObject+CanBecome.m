//
//  NSObject+CanBecome.m
//  Becoming
//
//  Created by coreyhaines on 6/9/13.
//  Copyright (c) 2013 coreyhaines. All rights reserved.
//

#import "NSObject+CanBecome.h"
#import <objc/runtime.h>

@implementation NSObject (CanBecome)

- (void)setPreviousType:(id)previousType
{
    objc_setAssociatedObject(self, &"_previousType", previousType, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (id)getPreviousType
{
    return objc_getAssociatedObject(self, &"_previousType");
}

- (void) become:(Class)thisClass
{
    NSLog(@"Becoming %@", thisClass);
    NSLog(@"From %@", [self getPreviousType]);
    [self setPreviousType:isa];
    isa = thisClass;
}
- (void) unbecome
{
    NSLog(@"CurrentType %@", isa);
    NSLog(@"Unbecoming %@", [self getPreviousType]);
    isa = [self getPreviousType];
    [self setPreviousType:nil];
}

- (id) performSelectorAsPreviousType:(SEL)selector
{
    id currentType = isa;
    isa = [self getPreviousType];
    id val = [self performSelector:selector];
    isa = currentType;
    return val;
}
@end
