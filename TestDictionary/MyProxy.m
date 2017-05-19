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


@implementation Province

- (NSString *)description
{
    return [NSString stringWithFormat:@"%p:<%@,%@>",self, self.name, self.shortName];
}

@end

@interface ChinaProvinceList ()
@property (strong, nonatomic) NSMutableArray *listArray;
@property (strong, nonatomic) NSMutableDictionary *listDictionary;

@end

@implementation ChinaProvinceList

- (Province *)objectAtIndexedSubscript:(NSUInteger)idx {
    return self.listArray[idx];
}

- (void)setObject:(Province *)obj atIndexedSubscript:(NSUInteger)idx {
    if (idx == -1) {
        [self.listArray addObject:obj];
        return;
    }
    self.listArray[idx] = obj;
}


- (NSMutableArray *)listArray {
    if (!_listArray) {
        self.listArray = [NSMutableArray array];
    }
    return _listArray;
}

- (nullable Province *)objectForKeyedSubscript:(NSString *)key {
    return self.listDictionary[key];
}


- (void)setObject:(nullable Province *)obj forKeyedSubscript:(NSString *)key {
    self.listDictionary[key] = obj;
    self[-1] = obj;
}

- (NSString *)description
{
    return self.listArray.description;
}

- (NSMutableDictionary *)listDictionary {
    if (!_listDictionary) {
        self.listDictionary = [NSMutableDictionary dictionary];
    }
    return _listDictionary;
}

@end
