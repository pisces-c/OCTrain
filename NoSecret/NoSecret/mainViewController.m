//
//  mainViewController.m
//  NoSecret
//
//  Created by 成城 on 14-7-23.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import "mainViewController.h"
#import "TableViewCell.h"

@interface mainViewController ()

@end

@implementation mainViewController

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
    UIView *TopView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 320, 60)];
    TopView.backgroundColor = [UIColor grayColor];
    UITableView *TableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, 320, 470)];
    [self.view addSubview:TopView];
    [self.view addSubview:TableView];
    UITabBar *bottomBar = [[UITabBar alloc] init];
    bottomBar.frame = CGRectMake(0, 530, 320, 40);
    
    TableView.dataSource = self;
    TableView.delegate = self;

    data = [[NSArray alloc] initWithObjects:@"A",@"B",@"C", nil];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellname = @"cell";
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellname];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil]lastObject];
    }
    //config the cell
    cell.backgrandimg.image = [UIImage imageNamed:@"img0.png"];
    cell.textfield.text = @"XXXXX";
    return cell;
}

@end
