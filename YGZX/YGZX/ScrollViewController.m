//
//  ScollViewController.m
//  YGZX
//
//  Created by chengcheng on 9/18/14.
//  Copyright (c) 2014 成城. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

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
    // Do any additional setup after loading the view from its nib.

	UIWebView *newsinfo = [[UIWebView alloc] init];
	newsinfo.frame = CGRectMake(0, 0, 320, 900);
	[self.view addSubview:newsinfo];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
