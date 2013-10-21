//
//  ViewController.m
//  BirthdayReminder
//
//  Created by Roy on 10/19/13.
//  Copyright (c) 2013 KMG Infotech. All rights reserved.
//

#import "ViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "AppDelegate.h"
#import "FBShareManager.h"
#import "FBFriendListViewController.h"
@interface ViewController ()
{
    AppDelegate *appDelegate;
    FBShareManager *fbShareManager;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    fbShareManager=[FBShareManager getFBSharedManager];
}

-(IBAction)fbAuthdentication
{
    if ([FBSession activeSession].isOpen) {
        [fbShareManager getUserFriendsList];
        
        UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
     FBFriendListViewController *controller=   [storyBoard instantiateViewControllerWithIdentifier:@"FBFriendListViewController"];
        fbShareManager.fbShareDelegate=controller;

        [self.navigationController pushViewController:controller animated:YES];
        
    }
    else
    {
        // create a fresh session object
        appDelegate.fbSession = [[FBSession alloc] init];
        
        // if we don't have a cached token, a call to open here would cause UX for login to
        // occur; we don't want that to happen unless the user clicks the login button, and so
        // we check here to make sure we have a token before calling open
        
        [FBSession openActiveSessionWithPermissions:@[@"publish_stream",@"read_stream",@"friends_birthday",@"user_birthday"]
                                       allowLoginUI:YES
                                  completionHandler:^(FBSession *session,
                                                      FBSessionState state,
                                                      NSError *error) {
                                      if (error) {
                                          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                              message:error.localizedDescription
                                                                                             delegate:nil
                                                                                    cancelButtonTitle:@"OK"
                                                                                    otherButtonTitles:nil];
                                          [alertView show];
                                      }
                                      else if (session.isOpen) {
                                          [fbShareManager getUserFriendsList];
                                          
                                          UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
                                          FBFriendListViewController *controller=   [storyBoard instantiateViewControllerWithIdentifier:@"FBFriendListViewController"];
                                          fbShareManager.fbShareDelegate=controller;

                                          [self.navigationController pushViewController:controller animated:YES];

                                          
                                      }
                                  }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
