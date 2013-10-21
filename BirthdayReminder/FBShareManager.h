//
//  FBShareManager.h
//  BirthdayReminder
//
//  Created by Roy on 10/19/13.
//  Copyright (c) 2013 KMG Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBShareManager : NSObject

@property(weak,nonatomic)id fbShareDelegate;

+ (id)getFBSharedManager;
-(id)getUserFriendsList;
@end
