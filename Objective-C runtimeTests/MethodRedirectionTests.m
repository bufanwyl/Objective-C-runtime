//
//  MethodRedirectionTests.m
//  Objective-C runtime
//
//  Created by Brooklyn on 2/6/13.
//  Copyright (c) 2013 nMotion. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "TestSupport.h"
#import "MethodRedirection.h"

//
// Simple base class that provides callbacks
//

@implementation ObjectWithCallback
{
    Callback _callback;
}

- (id)initWithCallback:(Callback)callback
{
    self->_callback = callback;
    return self;
}

- (void)callback
{
    if (self->_callback)
        self->_callback();
}

@end

@interface MethodRedirectionTests : SenTestCase
@end

@implementation MethodRedirectionTests

- (void)testMethodRedirection
{
    id surrogate = [CompletelyBogusClass new];
    id uut = [MethodRedirection withSurrogate:surrogate];
    
    [uut aCompletelyBogusMethod];
}

- (void)testMethodRedirectionUsingPerform
{
    id surrogate = [CompletelyBogusClass new];
    id uut = [MethodRedirection withSurrogate:surrogate];
    
    [uut performSelector:@selector(aCompletelyBogusMethod)];
}

@end

