//
//  FBFriendListViewController.m
//  BirthdayReminder
//
//  Created by Roy on 10/19/13.
//  Copyright (c) 2013 KMG Infotech. All rights reserved.
//

#import "FBFriendListViewController.h"
#import "FBShareManager.h"
@interface FBFriendListViewController ()
{
    FBShareManager *fbShareManager;
}
@end

@implementation FBFriendListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)reloadFBFriendData:(id)result
{
    fbFriendsData=[[NSArray alloc] initWithArray:result];
    
    NSSortDescriptor *sortDescriptor=[NSSortDescriptor sortDescriptorWithKey:@"birthday" ascending:YES];
  NSArray *result11=[result sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    
    
    fbFriendsData=[[NSArray alloc] initWithArray:result11];
    [fbTable setDelegate:self];
    [fbTable setDataSource:self];
    [fbTable reloadData];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    fbShareManager=[FBShareManager getFBSharedManager];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [fbFriendsData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[fbTable dequeueReusableCellWithIdentifier:@"fbCell" forIndexPath:indexPath];
    
    NSDictionary *dict=[fbFriendsData objectAtIndex:indexPath.row];
    cell.textLabel.text=[dict objectForKey:@"name"];
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict=[fbFriendsData objectAtIndex:indexPath.row];
    NSLog(@" %@",[dict objectForKey:@"birthday"]);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
