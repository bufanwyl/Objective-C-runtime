//
//  AspectHolderObservingInterfaceAggregation.m
//  Objective-C runtime
//
//  Created by Brooklyn on 2/6/13.
//  Copyright (c) 2013 nMotion. All rights reserved.
//

#import "AspectHolderObservingInterfaceAggregation.h"

@implementation AspectHolderObservingInterfaceAggregation

- (BOOL)respondsToSelector:(SEL)selector
{
    // check our call-chain first
    if ([super respondsToSelector:selector])
        return YES;
    
    // then determine if one of our surrogates responds to this
    for (id surrogate in self.aspects)
        if ([surrogate respondsToSelector:selector])
            return YES;
    
    return NO;
}

- (BOOL)conformsToProtocol:(Protocol *)protocol
{
    if ([super conformsToProtocol:protocol])
        return YES;
    
    // then determine if one of our surrogates conforms
    for (id surrogate in self.aspects)
        if ([surrogate conformsToProtocol:protocol])
            return YES;
    
    return NO;
}

- (BOOL)isKindOfClass:(Class)clazz
{
    if ([super isKindOfClass:clazz])
        return YES;
    
    // then determine if one of our surrogates conforms
    for (id surrogate in self.aspects)
        if ([surrogate isKindOfClass:clazz])
            return YES;
    
    return NO;
}

@end
