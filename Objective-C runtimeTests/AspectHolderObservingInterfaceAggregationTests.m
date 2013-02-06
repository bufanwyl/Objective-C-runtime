//
//  AspectHolderObservingInterfaceAggregationTests.m
//  Objective-C runtime
//
//  Created by Brooklyn on 2/6/13.
//  Copyright (c) 2013 nMotion. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "TestSupport.h"
#import "AspectHolderObservingInterfaceAggregation.h"

@interface AspectHolderObservingInterfaceAggregationTests : SenTestCase
@end

@implementation AspectHolderObservingInterfaceAggregationTests

//
// AspectHolder tests
//

- (void)testAspectHolderWhileEmpty
{
    id aspects = [AspectHolderObservingInterfaceAggregation new];
    
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
    id aspects = [[AspectHolderObservingInterfaceAggregation new] addAspect:nil];
    
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
    id aspects = [[AspectHolderObservingInterfaceAggregation new] addAspects:nil];
    
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
    
    id aspects = [[AspectHolderObservingInterfaceAggregation new] addAspect:[[CompletelyBogusClass new] initWithCallback:^() {
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
    
    id<AspectHolder> holder = [AspectHolderObservingInterfaceAggregation new];
    
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
    
    id<AspectHolder> holder = [AspectHolderObservingInterfaceAggregation new];
    
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

//
// Observing interface inheritance tests
//

- (void)testRespondsToSelector
{
    __block bool firstMethodCalled = false;
    __block bool secondMethodCalled = false;
    
    id<AspectHolder> holder = [AspectHolderObservingInterfaceAggregation new];
    
    NSArray* aspects = [NSMutableArray arrayWithObjects:
            [[CompletelyBogusClass new] initWithCallback:^() { firstMethodCalled = true; }],
            [[ClassWithADifferentMethod new] initWithCallback:^() { secondMethodCalled = true; }],
            nil];
    
    [holder addAspects:aspects];
    
    id object = holder;

    STAssertTrue ( [object respondsToSelector:@selector(aCompletelyBogusMethod)], @"" );
    STAssertTrue ( [object respondsToSelector:@selector(AnotherCompletelyBogusMethod)], @"" );
    STAssertFalse( [object respondsToSelector:@selector(AMethodWhichIsNotImplemented)], @"" );
}

- (void)testConformsToProtocol
{
    __block bool firstMethodCalled = false;
    __block bool secondMethodCalled = false;
    
    id<AspectHolder> holder = [AspectHolderObservingInterfaceAggregation new];
    
    NSArray* aspects = [NSMutableArray arrayWithObjects:
                        [[CompletelyBogusClass new] initWithCallback:^() { firstMethodCalled = true; }],
                        [[ClassWithADifferentMethod new] initWithCallback:^() { secondMethodCalled = true; }],
                        nil];
    
    [holder addAspects:aspects];
    
    id object = holder;
    
    STAssertTrue ( [object conformsToProtocol:@protocol(BogusInterface)], @"" );
    STAssertTrue ( [object conformsToProtocol:@protocol(AnotherBogusInterface)], @"" );
    STAssertFalse( [object conformsToProtocol:@protocol(AProtocolToConformTo)], @"" );
}

- (void)testIsKindOfClass
{
    __block bool firstMethodCalled = false;
    __block bool secondMethodCalled = false;
    
    id<AspectHolder> holder = [AspectHolderObservingInterfaceAggregation new];
    
    NSArray* aspects = [NSMutableArray arrayWithObjects:
                        [[CompletelyBogusClass new] initWithCallback:^() { firstMethodCalled = true; }],
                        [[ClassWithADifferentMethod new] initWithCallback:^() { secondMethodCalled = true; }],
                        nil];
    
    [holder addAspects:aspects];
    
    id object = holder;
    
    STAssertTrue ( [object isKindOfClass:CompletelyBogusClass.class], @"" );
    STAssertTrue ( [object isKindOfClass:ClassWithADifferentMethod.class], @"" );
    STAssertTrue ( [object isKindOfClass:CompletelyBogusClass.class], @"" );
}

@end
