//
//  TestSupport.h
//  Objective-C runtime
//
//  Created by Brooklyn on 2/6/13.
//  Copyright (c) 2013 nMotion. All rights reserved.
//

//
// A simple protocol to give us a method signature (appeases the compiler)
//

@protocol BogusInterface <NSObject>
- (void)aCompletelyBogusMethod;
@end

//
//
//
@protocol AnotherBogusInterface <NSObject>
- (void)AnotherCompletelyBogusMethod;
@end

//
// A simple protocol to give us another method signature (also appeases the compiler)
//

@protocol DummyInterface <NSObject>
- (void) AMethodWhichIsNotImplemented;
@end

//
// A simple protocol that we can use when we test conforms to protocol
//

@protocol AProtocolToConformTo <NSObject>
@end

//
// This provides a base implementation for callers to provide a callback
//

@interface ObjectWithCallback : NSObject
typedef void (^Callback)(void);
- (id)initWithCallback:(Callback)callback;
- (void)callback;
@end

//
// Simple class that provides a method implementation
//

@interface CompletelyBogusClass : ObjectWithCallback<BogusInterface>
- (void)aCompletelyBogusMethod;
@end

//
// A different class so we can test using multiple surrogates
//

@interface ClassWithADifferentMethod : ObjectWithCallback<AnotherBogusInterface>
- (void)AnotherCompletelyBogusMethod;
@end

//
// A class definition we can use when we're testing isKindOfClass:
//

@interface AClassToBeLike
@end


