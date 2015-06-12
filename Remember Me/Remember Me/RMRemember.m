//
//  RMRemember.m
//  Remember Me
//
//  Created by Ryan Wahle on 6/10/15.
//  Copyright (c) 2015 Ryan Wahle. All rights reserved.
//

#import "RMRemember.h"

@implementation RMRemember

// Specify default values for properties

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"remember" : @"Remember",
             @"information" : @"This information"};
}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
