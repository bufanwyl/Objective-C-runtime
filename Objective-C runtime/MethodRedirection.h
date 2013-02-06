//
//  MethodRedirection.h
//  Objective-C runtime
//
//  Created by Brooklyn on 2/4/13.
//  Copyright (c) 2013 nMotion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RuntimeLifecycle.h"

@interface MethodRedirection : RuntimeLifecycle

@property (nonatomic,strong) id surrogate;

+(id)withSurrogate:(id)surrogate;

@end
