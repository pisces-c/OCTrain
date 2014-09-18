//
//  MainViewController.m
//  YGZX
//
//  Created by 成城 on 14-9-17.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import "MainViewController.h"
#import "LeftMenuViewController.h"
#import "RightMenuViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickleft:)];
	UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickright:)];
	self.navigationItem.leftBarButtonItem = left;
	self.navigationItem.rightBarButtonItem = right;
	
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)clickleft:(id)sender
{
	LeftMenuViewController *leftmenu = [[LeftMenuViewController alloc] init];
	[self.navigationController pushViewController:leftmenu animated:YES];
}
-(void)clickright:(id)sender
{
	RightMenuViewController *rightmenu = [[RightMenuViewController alloc] init];
	[self.navigationController pushViewController:rightmenu animated:YES];
}







@end
