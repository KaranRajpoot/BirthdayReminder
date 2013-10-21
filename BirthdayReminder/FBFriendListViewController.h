//
//  FBFriendListViewController.h
//  BirthdayReminder
//
//  Created by Roy on 10/19/13.
//  Copyright (c) 2013 KMG Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBFriendListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
IBOutlet UITableView *fbTable;
    NSArray *fbFriendsData;
}
-(void)reloadFBFriendData:(id)result;
@end
