//
//  TestSupport.m
//  Objective-C runtime
//
//  Created by Brooklyn on 2/6/13.
//  Copyright (c) 2013 nMotion. All rights reserved.
//

#import "TestSupport.h"

@implementation CompletelyBogusClass

- (void)aCompletelyBogusMethod
{
    [self callback];
}

@end

@implementation ClassWithADifferentMethod

- (void)AnotherCompletelyBogusMethod
{
    [self callback];
}

@end

@implementation AClassToBeLike
@end
