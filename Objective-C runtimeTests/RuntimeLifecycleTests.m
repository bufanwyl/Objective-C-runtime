//
//  Objective_C_runtimeTests.m
//  Objective-C runtimeTests
//
//  Created by Brooklyn on 2/4/13.
//  Copyright (c) 2013 nMotion. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "TestSupport.h"
#import "RuntimeLifecycle.h"

@interface RuntimeLifecycleTests : SenTestCase
@end

@implementation RuntimeLifecycleTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{    
    [super tearDown];
}

- (void)test_0_RespondsToSelector
{
    id uut = [RuntimeLifecycle alloc];
    
    STAssertFalse( [uut respondsToSelector:@selector(aCompletelyBogusMessage)], @"respondsToSelector: should've returned FALSE" );
}

- (void)test_1_DoesNotRecognizeSelector
{
    id uut = [RuntimeLifecycle alloc];
    
    @try {
        [uut performSelector:@selector(aCompletelyBogusMessage)];
    } @catch (NSException *exception) {
    } @finally {
    }
}

- (void)test_2_performAnExampleMethod
{
    id uut = [RuntimeLifecycle alloc];
    
    [uut respondsToSelector:@selector(anExampleMethod)];
    [uut performSelector:@selector(anExampleMethod)];
}

- (void)test_3_AnExampleMethod
{
    id uut = [RuntimeLifecycle alloc];
    
    [uut anExampleMethod];
}

- (void)test_4_aCompletelyBogusMethod
{
    id uut = [RuntimeLifecycle alloc];
    
    @try {
        [uut aCompletelyBogusMethod];
    } @catch (NSException *exception) {
    } @finally {
    }
}

@end

