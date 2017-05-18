//
//  MyProxy.m
//  TestDictionary
//
//  Created by yanguo sun on 17/05/2017.
//  Copyright © 2017 Lvmama. All rights reserved.
//

#import "MyProxy.h"

@implementation MyProxy
+ (id)proxyForObject:(id)obj {
    MyProxy *instance = [MyProxy alloc];
    instance->_object = obj;

    return instance;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [_object methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    if ([_object respondsToSelector:invocation.selector]) {
        NSString *selectorName = NSStringFromSelector(invocation.selector);

        NSLog(@"Before calling \"%@\".", selectorName);
        [invocation invokeWithTarget:_object];
        NSLog(@"After calling \"%@\".", selectorName);
    }
}

@end

