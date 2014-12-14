//
//  TableViewController.m
//  yangangguoji_test
//
//  Created by chengcheng on 14/11/28.
//  Copyright (c) 2014年 成城. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
{
	Net *net;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	SlideViewController *svc = [[SlideViewController alloc] init];
	[svc createimgview];
	CGRect f = self.view.frame;
	self.tableView.frame = CGRectMake(f.origin.x, f.origin.y+24, f.size.width, f.size.height);
	self.tableView.tableHeaderView = svc.scrollimgview;
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	
	net = [[Net alloc] init];
	net.delegate = self;
	[net GetNewsCatalogs];
	
}

- (void)didUpdatedNewsCatalogs:(NSArray *)newscatalogs {
	
	_newscatalogs = newscatalogs;
	for (int i=0; i<[_newscatalogs count]; i++) {
		_newscatalogname = [[_newscatalogs objectAtIndex:i] objectForKey:@"name"];
	}
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
//TODO
	return _newscatalogname.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellname = @"cell";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellname forIndexPath:indexPath];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellname];
		
		[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
	
	return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
