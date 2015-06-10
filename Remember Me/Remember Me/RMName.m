//
//  RMName.m
//  Remember Me
//
//  Created by Ryan Wahle on 6/10/15.
//  Copyright (c) 2015 Ryan Wahle. All rights reserved.
//

#import "RMName.h"

@implementation RMName

// Specify properties to index
+ (NSArray *)indexedProperties {
    return @[@"name"];
}

// Specify default values for properties

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"name" : @""};
}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
