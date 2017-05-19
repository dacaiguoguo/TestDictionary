//
//  main.m
//  TestDictionary
//
//  Created by yanguo sun on 17/05/2017.
//  Copyright © 2017 Lvmama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProxy.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableDictionary *mut = [MyProxy proxyForObject:[NSMutableDictionary dictionary]];
        NSMutableArray *mutArray = [MyProxy proxyForObject:[NSMutableArray arrayWithObjects:@(1),@(2),@(3), nil]];

        mut[@"testKey"] = nil;//object为nil 不会挂，底层实际调用下面的方法    建议使用
        [mut setObject:nil forKeyedSubscript:@"testKey"];//object为nil 不会挂,不应该直接调用

        id testObj = @(1);
        [mut setObject:testObj forKey:@"testKey"];// object为nil会挂 老的写法 不建议使用
        mutArray[1] = @(4);

       [mutArray setObject:@(4) atIndexedSubscript:1];
        //key 为nil 两种写法都会挂

        ChinaProvinceList *list = [[ChinaProvinceList alloc] init];
        Province *hebei = [[Province alloc] init];
        hebei.name = @"河北";
        hebei.shortName = @"冀";
        list[0] = hebei;

        Province *shanghai = [[Province alloc] init];
        shanghai.name = @"上海";
        shanghai.shortName = @"沪";
        list[1] = shanghai;

        Province *beijing = [[Province alloc] init];
        beijing.name = @"北京";
        beijing.shortName = @"京";
        list[@"首都"] = beijing;


        NSLog(@"Hello, World!");
    }
    return 0;
}
