//
//  BecomingTests.m
//  BecomingTests
//
//  Created by coreyhaines on 6/8/13.
//  Copyright (c) 2013 coreyhaines. All rights reserved.
//

#import "BecomingTests.h"
#import "HasSelectorBar.h"
#import "HasSelectorFoo.h"

@implementation BecomingTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testUnbecomingReturns
{
    HasSelectorBar * bar = [[HasSelectorBar alloc] init];
    
    STAssertEquals(@"Bar", [bar tellMe], @"Bar returns Bar");
    
    HasSelectorFoo * foo = [[HasSelectorFoo alloc] init];
    
    STAssertEquals(@"Foo", [foo tellMe], @"Foo returns Foo");
}

@end
