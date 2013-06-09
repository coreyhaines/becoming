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
#import "HasANumber.h"
#import "MultipliesByTwo.h"
#import "HasANumberTimesThree.h"

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

- (void) testMakingFooABar
{
    HasSelectorFoo * foo = [[HasSelectorFoo alloc] init];
    
    [foo become:[HasSelectorBar class]];
    NSLog(@"%@ %@",[foo class], [foo className]);
    STAssertTrue([@"HasSelectorBar" isEqualToString:[foo className]], @"Expecting foo to become Bar");
    STAssertEquals(@"Bar", [foo tellMe], @"Foo returns Bar now");
}

- (void) testMakingBarAFoo
{
    HasSelectorBar * bar = [[HasSelectorBar alloc] init];
    
    [bar become:[HasSelectorFoo class]];
    NSLog(@"%@ %@",[bar class], [bar className]);
    STAssertTrue([@"HasSelectorFoo" isEqualToString:[bar className]], @"Expecting bar to become Foo");
    STAssertEquals(@"Foo", [bar tellMe], @"Bar returns Foo now");
}

- (void) testCallingNewMethodOnNewType
{
    id foo = [[HasSelectorBar alloc] init];
    [foo become:[HasSelectorFoo class]];
    [foo callFoo];
}

- (void) testNewImplementationCanUseOldTypesStuff
{
    HasANumber * hasNumber = [[HasANumber alloc] init];
    [hasNumber setNumber: @10];
    id toBecome = hasNumber;
    [toBecome become:[MultipliesByTwo class]];
    
    STAssertEqualObjects(@20, [toBecome newNumber], @"It should multiply by 2");
}

-(void) testNewTypeCanHaveMethodWithSameNameAsOldTypeAndStillAccess
{
    HasANumber * hasNumber = [[HasANumber alloc] init];
    hasNumber.number = @10;
    id toBecome = hasNumber;
    [toBecome become:[HasANumberTimesThree class]];
    
    STAssertEqualObjects(@30, [toBecome number], @"It should multiply by 3");
}

-(void) testCanUnbecome
{
    HasANumber * hasNumber = [[HasANumber alloc] init];
    hasNumber.number = @10;
    id toBecome = hasNumber;
    [toBecome become:[HasANumberTimesThree class]];
    
    STAssertEqualObjects(@30, [toBecome number], @"It should multiply by 3");

    [toBecome unbecome];
    STAssertEqualObjects(@10, [toBecome number], @"It should be back to original");
}
@end
