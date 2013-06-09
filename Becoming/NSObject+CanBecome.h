//
//  NSObject+CanBecome.h
//  Becoming
//
//  Created by coreyhaines on 6/9/13.
//  Copyright (c) 2013 coreyhaines. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CanBecome)
- (void) become:(Class) thisClass;
- (void) unbecome;
- (id) performSelectorAsPreviousType:(SEL)selector;
@end
