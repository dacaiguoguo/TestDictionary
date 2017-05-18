//
//  MyProxy.h
//  TestDictionary
//
//  Created by yanguo sun on 17/05/2017.
//  Copyright © 2017 Lvmama. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyProxy : NSProxy
{
    id _object;
}

+ (id)proxyForObject:(id)obj;

@end

