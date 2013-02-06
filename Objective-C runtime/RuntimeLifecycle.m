//
//  RuntimeLifecycle.m
//  Objective-C runtime
//
//  Created by Brooklyn on 2/4/13.
//  Copyright (c) 2013 nMotion. All rights reserved.
//

#import "RuntimeLifecycle.h"

// This class provides a visual illustration of the lifecycle callbacks that occur
// as the Objective-C Runtime determines how to bind messages to methods at runtime.

@implementation RuntimeLifecycle

+ (BOOL)resolveClassMethod:(SEL)name
{
    NSLog(@"[%@] resolveClassMethod: \"%@\"",self,NSStringFromSelector(name));
    return [super resolveClassMethod:name];
}

+ (BOOL)resolveInstanceMethod:(SEL)name
{
    NSLog(@"[%@] resolveInstanceMethod: \"%@\"",self,NSStringFromSelector(name));
    return [super resolveInstanceMethod:name];
}

+ (IMP)instanceMethodForSelector:(SEL)aSelector
{
    NSLog(@"[%@] instanceMethodForSelector: \"%@\"",self,NSStringFromSelector(aSelector));
    return [super instanceMethodForSelector:aSelector];
}

+ (NSMethodSignature *)instanceMethodSignatureForSelector:(SEL)aSelector
{
    NSLog(@"[%@] instanceMethodSignatureForSelector: \"%@\"",self,NSStringFromSelector(aSelector));
    return [super instanceMethodSignatureForSelector:aSelector];
}

+ (BOOL)instancesRespondToSelector:(SEL)aSelector
{
    NSLog(@"[%@] instancesRespondToSelector: \"%@\"",self,NSStringFromSelector(aSelector));
    return [super instancesRespondToSelector:aSelector];
}

+ (BOOL)conformsToProtocol:(Protocol *)aProtocol
{
    NSLog(@"[%@] conformsToProtocol: \"%@\"",self,NSStringFromProtocol(aProtocol));
    return [super conformsToProtocol:aProtocol];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    NSLog(@"[%@] respondsToSelector: \"%@\"",self.class,NSStringFromSelector(aSelector));
    return [super respondsToSelector:aSelector];
}

- (id)performSelector:(SEL)aSelector
{
    NSLog(@"[%@] performSelector: \"%@\"",self.class,NSStringFromSelector(aSelector));
    return [super performSelector:aSelector];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"[%@] doesNotRecognizeSelector: \"%@\"",self.class,NSStringFromSelector(aSelector));
    [super doesNotRecognizeSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSLog(@"[%@] methodSignatureForSelector: \"%@\"",self.class,NSStringFromSelector(aSelector));
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"[%@] forwardInvocation: \"%@\"",self.class,NSStringFromSelector([anInvocation selector]));
    [super forwardInvocation:anInvocation];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSLog(@"[%@] forwardingTargetForSelector: \"%@\"",self.class,NSStringFromSelector(aSelector));
    return [super forwardingTargetForSelector:aSelector];
}

- (void)anExampleMethod
{
    NSLog(@"[%@] anExampleMethod",self.class);
}

@end
