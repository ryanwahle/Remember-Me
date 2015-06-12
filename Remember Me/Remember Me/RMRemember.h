//
//  RMRemember.h
//  Remember Me
//
//  Created by Ryan Wahle on 6/10/15.
//  Copyright (c) 2015 Ryan Wahle. All rights reserved.
//

#import <Realm/Realm.h>

@interface RMRemember : RLMObject
@property NSString *remember;
@property NSString *information;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<RMRemember>
RLM_ARRAY_TYPE(RMRemember)

