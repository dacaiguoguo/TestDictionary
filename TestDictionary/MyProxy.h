//
//  MyProxy.h
//  TestDictionary
//
//  Created by yanguo sun on 17/05/2017.
//  Copyright © 2017 Lvmama. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface MyProxy : NSProxy
{
    id _object;
}

+ (id)proxyForObject:(id)obj;

@end

@interface Province : NSObject
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *shortName;
@end

@interface ChinaProvinceList : NSObject
- (nullable Province *)objectForKeyedSubscript:(NSString *)key;
- (void)setObject:(nullable Province *)obj forKeyedSubscript:(NSString *)key;
- (Province *)objectAtIndexedSubscript:(NSUInteger)idx;
- (void)setObject:(Province *)obj atIndexedSubscript:(NSUInteger)idx;
@end
NS_ASSUME_NONNULL_END

