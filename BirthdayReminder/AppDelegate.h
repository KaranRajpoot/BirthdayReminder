//
//  AppDelegate.h
//  BirthdayReminder
//
//  Created by Roy on 10/19/13.
//  Copyright (c) 2013 KMG Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property(strong,nonatomic)FBSession *fbSession;
@property (strong, nonatomic) UIWindow *window;

@end
