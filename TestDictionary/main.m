//
//  main.m
//  TestDictionary
//
//  Created by yanguo sun on 17/05/2017.
//  Copyright © 2017 Lvmama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProxy.h"
#include <objc/runtime.h>
#include <objc/objc-exception.h>

int my_exception_matcher(Class match_class, id exception)
{
    /* Always matches.  */
    return 1;
}

static unsigned int handlerExpected = 1;

void my_exception_handler(id excp)
{
    /* Returning from the handler would abort.  */
    if (handlerExpected) {
        exit(0);
    }


    //abort();
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        objc_setExceptionMatcher (my_exception_matcher);
        objc_setUncaughtExceptionHandler (my_exception_handler);


        NSMutableDictionary *mut = [MyProxy proxyForObject:[NSMutableDictionary dictionary]];

        mut[@"testKey"] = nil;//object为nil 不会挂，底层实际调用下面的方法    建议使用
        [mut setObject:nil forKeyedSubscript:@"testKey"];//object为nil 不会挂,不应该直接调用
        @try {
            id testObj = nil;
            [mut setObject:testObj forKey:@"testKey"];// object为nil会挂 老的写法 不建议使用
        } @catch (NSException *exception) {

        } @finally {
            
        }


        //key 为nil 两种写法都会挂

        NSLog(@"Hello, World!");
    }
    return 0;
}
