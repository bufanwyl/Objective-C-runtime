//
//  AspectHolder.h
//  Objective-C runtime
//
//  Created by Brooklyn on 2/5/13.
//  Copyright (c) 2013 nMotion. All rights reserved.
//

#import "RuntimeLifecycle.h"

//
// This protocol calls out the fundamental behavior we expect from an object that
// implements Aspects.
//
@protocol AspectHolder <NSObject>
@property (nonatomic,strong,readonly) NSMutableArray* aspects;

- (id)addAspect:(id)aspect;
- (id)addAspects:(NSArray*)aspects;
@end

//
// This class is a basic implementation of AspectHolder that provides a simple bucket to
// hold other objects, and upon receiving a message searches its group of objects for a
// suitable receiver, forwarding the message to that receiver, or responding with
// 'doeNotRecognizeSelector', which is the default behavior.
//
@interface AspectHolder : NSObject<AspectHolder>
- (id)addAspect:(id)aspect;
- (id)addAspects:(NSArray*)aspects;
@end
