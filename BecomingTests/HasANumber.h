//
//  HasANumber.h
//  Becoming
//
//  Created by coreyhaines on 6/8/13.
//  Copyright (c) 2013 coreyhaines. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Becoming.h"

@interface HasANumber : Becoming
{
    NSNumber *number;
}
-(void) setNumber:(NSNumber *)newNumber;
-(NSNumber *) number;
@end
