//
//  AspectHolderTests.m
//  Objective-C runtime
//
//  Created by Brooklyn on 2/6/13.
//  Copyright (c) 2013 nMotion. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "TestSupport.h"
#import "AspectHolder.h"

@interface AspectHolderTests : SenTestCase
@property (nonatomic,strong) id<AspectHolder> aspects;
@end

@implementation AspectHolderTests

- (void)testAspectHolderWhileEmpty
{
    id aspects = [AspectHolder new];
    
    bool exceptionOccurred = false;
    
    @try {
        [aspects aCompletelyBogusMethod];
    }
    @catch (NSException *exception) {
        exceptionOccurred = true;
    }
    @finally {
        STAssertTrue(exceptionOccurred,@"");
    }
}

- (void)testAspectHolderAddNilAspect
{
    id aspects = [[AspectHolder new] addAspect:nil];
    
    bool exceptionOccurred = false;
    
    @try {
        [aspects aCompletelyBogusMethod];
    }
    @catch (NSException *exception) {
        exceptionOccurred = true;
    }
    @finally {
        STAssertTrue(exceptionOccurred,@"");
    }
}

- (void)testAspectHolderAddNilAspects
{
    id aspects = [[AspectHolder new] addAspects:nil];
    
    bool exceptionOccurred = false;
    
    @try {
        [aspects aCompletelyBogusMethod];
    }
    @catch (NSException *exception) {
        exceptionOccurred = true;
    }
    @finally {
        STAssertTrue(exceptionOccurred,@"");
    }
}

- (void)testAspectHolderAddNonNilAspect
{
    __block bool methodCalled = false;
    
    id aspects = [[AspectHolder new] addAspect:[[CompletelyBogusClass new] initWithCallback:^() {
        methodCalled = true;
    }]];
    
    bool exceptionOccurred = false;
    
    @try {
        [aspects aCompletelyBogusMethod];
    }
    @catch (NSException *exception) {
        exceptionOccurred = true;
    }
    @finally {
        STAssertFalse(exceptionOccurred,@"");
        STAssertTrue(methodCalled,@"");
    }
}

- (void)testAspectHolderAddMultipleNonNilAspect
{
    __block bool firstMethodCalled = false;
    __block bool secondMethodCalled = false;
    
    id<AspectHolder> holder = [AspectHolder new];
    
    [holder addAspect:[[CompletelyBogusClass new] initWithCallback:^() { firstMethodCalled = true; }]];
    [holder addAspect:[[ClassWithADifferentMethod new] initWithCallback:^() { secondMethodCalled = true; }]];
    
    bool exceptionOccurred = false;
    id object = holder;
    
    @try {
        [object aCompletelyBogusMethod];
        [object AnotherCompletelyBogusMethod];
        [object AMethodWhichIsNotImplemented];
    }
    @catch (NSException *exception) {
        exceptionOccurred = true;
    }
    @finally {
        STAssertTrue(firstMethodCalled,@"");
        STAssertTrue(secondMethodCalled,@"");
        STAssertTrue(exceptionOccurred,@"");
    }
}

- (void)testAspectHolderAddMultipleNonNilAspects
{
    __block bool firstMethodCalled = false;
    __block bool secondMethodCalled = false;
    
    id<AspectHolder> holder = [AspectHolder new];
    
    NSArray* aspects = [NSMutableArray arrayWithObjects:
                        [[CompletelyBogusClass new] initWithCallback:^() { firstMethodCalled = true; }],
                        [[ClassWithADifferentMethod new] initWithCallback:^() { secondMethodCalled = true; }],
                        nil];
    
    [holder addAspects:aspects];
    
    bool exceptionOccurred = false;
    id object = holder;
    
    @try {
        [object aCompletelyBogusMethod];
        [object AnotherCompletelyBogusMethod];
        [object AMethodWhichIsNotImplemented];
    }
    @catch (NSException *exception) {
        exceptionOccurred = true;
    }
    @finally {
        STAssertTrue(firstMethodCalled,@"");
        STAssertTrue(secondMethodCalled,@"");
        STAssertTrue(exceptionOccurred,@"");
    }
}

@end
