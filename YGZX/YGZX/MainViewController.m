//
//  MainViewController.m
//  YGZX
//
//  Created by 成城 on 14-9-17.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import "MainViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "ScrollViewController.h"

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
	
	MMDrawerBarButtonItem *leftbutton = [[MMDrawerBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickleft:)];
	MMDrawerBarButtonItem *rightbutton = [[MMDrawerBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickright:)];
	self.navigationItem.leftBarButtonItem = leftbutton;
	self.navigationItem.rightBarButtonItem = rightbutton;

	tableview = [[UITableView alloc] init];
	svbutton = [[UIScrollView alloc] init];
	svimg= [[UIScrollView alloc] init];
//	UIView *dots = [[UIView alloc] init];
//	dots.frame = CGRectMake(110, 100, 50, 45);
	svimg.contentSize = CGSizeMake(1280, 160);
	svimg.contentOffset = CGPointMake(svimg.frame.origin.x, svimg.frame.origin.y);
	svimg.pagingEnabled = YES;
	svimg.scrollEnabled = YES;
	svimg.showsHorizontalScrollIndicator = NO;
	
	pagectrl = [[UIPageControl alloc] init];
	
	
	UIImageView *img1 = [[UIImageView alloc] init];
	UIImageView *img2 = [[UIImageView alloc] init];
	UIImageView *img3 = [[UIImageView alloc] init];
	UIImageView *img4 = [[UIImageView alloc] init];
	img1.backgroundColor = [UIColor redColor];
	img2.backgroundColor = [UIColor greenColor];
	img3.backgroundColor = [UIColor grayColor];
	img4.backgroundColor = [UIColor blueColor];
	img1.frame = CGRectMake(0, 0, 320, 160);
	img2.frame = CGRectMake(320, 0, 320, 160);
	img3.frame = CGRectMake(640, 0, 320, 160);
	img4.frame = CGRectMake(960, 0, 320, 160);
	
	imgarray = [[NSMutableArray alloc] initWithObjects:img1,img2,img3,img4,nil];
	
	pagectrl.frame = CGRectMake(135, 100, 50, 45);
	pagectrl.numberOfPages = 4;
	pagectrl.currentPage = 0;
	
	tableview.frame = CGRectMake(0, 30, 320, 960);
	svbutton.frame = CGRectMake(0, 50, 320, 45);
	svimg.frame = CGRectMake(0, 0, 320, 160);
	
	svbutton.backgroundColor = [UIColor redColor];
	svimg.backgroundColor = [UIColor greenColor];
	
	tableview.tableHeaderView = svimg;
	tableview.sectionHeaderHeight = 100;
	
	[self.navigationController.view addSubview:svbutton];
	[self.view addSubview:tableview];
//	[tableview addSubview:dots];
	[svimg addSubview:img1];
	[svimg addSubview:img2];
	[svimg addSubview:img3];
	[svimg addSubview:img4];
	[tableview addSubview:pagectrl];
	
//	[pagectrl addTarget:self action:@selector(clickPage:) forControlEvents:UIControlEventTouchDown];
	tableview.delegate = self;
	tableview.dataSource = self;
	svimg.delegate =  self;
	
	
	
	
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	pagectrl.currentPage = svimg.contentOffset.x/svimg.bounds.size.width;
}
//
//- (void)clickPage:(id)sender{
//	NSInteger w = pagectrl.currentPage;
////	[svimg setContentOffset:CGPointMake(pagectrl.currentPage/w, 0) animated:YES];
//	
//	[svimg setContentOffset:CGPointMake((svimg.contentSize.width/(pagectrl.currentPage+1))*w, 0) animated:YES];
//	
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellname = @"newscell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellname];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellname];
	}
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	ScrollViewController *scv = [[ScrollViewController alloc] init];
	[self.navigationController pushViewController:scv animated:YES];
}

-(void)clickleft:(id)sender
{
	[self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
-(void)clickright:(id)sender
{
	[self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}







@end
