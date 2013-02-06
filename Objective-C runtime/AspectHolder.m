//
//  AspectHolder.m
//  Objective-C runtime
//
//  Created by Brooklyn on 2/5/13.
//  Copyright (c) 2013 nMotion. All rights reserved.
//

#import "AspectHolder.h"

//
// Class Category for our private members
//
@interface AspectHolder ()
@property (nonatomic,strong,readwrite) NSMutableArray* aspects;
@end

//
// Class implementation
//
@implementation AspectHolder

- (id)init
{
    if ( (self = [super init]) )
        self.aspects = [NSMutableArray new];
    
    return self;
}

- (id)addAspect:(id)aspect
{
    if (aspect == nil)
        NSLog(@"[%@] addAspect: received a nil aspect",self.class);
    else
        [self.aspects addObject:aspect];
    
    return self;
}

- (id)addAspects:(NSArray*)aspects
{    
    if (aspects == nil)
        NSLog(@"[%@] addAspects: received a nil set of aspects",self.class);
    else {
        for (id aspect in aspects)
            [self addAspect:aspect];
    }
    
    return self;
}

//
// Message Forwarding Implementation
//

- (id)forwardingTargetForSelector:(SEL)selector
{
    // locate the 1st surrogate to implement the message
    for (id surrogate in self.aspects)
        if ([surrogate respondsToSelector:selector])
            return surrogate;
    
    // if we don't hold this aspect, then perform the default behavior
    return [super forwardingTargetForSelector:selector];
}

@end
