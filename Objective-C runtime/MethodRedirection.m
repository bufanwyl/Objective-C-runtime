//
//  MethodRedirection.m
//  Objective-C runtime
//
//  Created by Brooklyn on 2/4/13.
//  Copyright (c) 2013 nMotion. All rights reserved.
//

#import "MethodRedirection.h"

@implementation MethodRedirection

//
// a helper method simply to ease instantiation for instances of this class
//
+(id)withSurrogate:(id)surrogate
{
    MethodRedirection* this = [MethodRedirection new];
    this.surrogate = surrogate;
    return this;
}

//
// this override is required for 'forwardInvocation:' to work, as this method
// provides the method signature which is held in the NSInvocation.
//
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSLog(@"[%@] methodSignatureForSelector: \"%@\"",self.class,NSStringFromSelector(aSelector));
    return [self.surrogate methodSignatureForSelector:aSelector];
}

//
// this is the heart of the forwarding mechanism
//
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL selector = [anInvocation selector];
    NSString* method = NSStringFromSelector(selector);
    
    NSLog(@"[%@] forwardInvocation: \"%@\"",self.class,method);
    
    NSLog(@"[%@] searching for implementation of %@ ...",self.class,method);
    
    if ([self.surrogate respondsToSelector:selector])
    {
        NSLog(@"[%@] %@ method forwarded",self.class,method);
        [anInvocation invokeWithTarget:self.surrogate];
    }
    
    else
    {
        NSLog(@"[%@] %@ method not found",self.class,method);
        [super forwardInvocation:anInvocation];
    }
}

@end
