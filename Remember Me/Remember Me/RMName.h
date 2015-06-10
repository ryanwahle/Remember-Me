//
//  RMName.h
//  Remember Me
//
//  Created by Ryan Wahle on 6/10/15.
//  Copyright (c) 2015 Ryan Wahle. All rights reserved.
//

#import <Realm/Realm.h>

@interface RMName : RLMObject
@property NSString *name;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<RMName>
RLM_ARRAY_TYPE(RMName)
