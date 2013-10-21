//
//  FBShareManager.m
//  BirthdayReminder
//
//  Created by Roy on 10/19/13.
//  Copyright (c) 2013 KMG Infotech. All rights reserved.
//

#import "FBShareManager.h"
#import <FacebookSDK/FacebookSDK.h>
#import "FBFriendListViewController.h"
@implementation FBShareManager
@synthesize fbShareDelegate=_fbShareDelegate;
+ (id)getFBSharedManager {
    static FBShareManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


-(void)getUserFriendsList
{
    
    
    NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:@"id,name,picture,gender,birthday",@"fields", nil];
    
    [FBRequestConnection startWithGraphPath:@"me/friends" parameters:dict HTTPMethod:@"GET" completionHandler:^(FBRequestConnection *conn ,id result ,NSError *err){
        if (err) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:err.localizedDescription
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
        
        else
        {
            
            NSArray *list=[result objectForKey:@"data"];
            NSLog(@"%d",[list count]);

            [(FBFriendListViewController *)_fbShareDelegate reloadFBFriendData:list];

        }
        
    }];
}
@end
