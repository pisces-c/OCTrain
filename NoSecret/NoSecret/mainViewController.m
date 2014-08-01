//
//  mainViewController.m
//  NoSecret
//
//  Created by 成城 on 14-7-23.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import "mainViewController.h"
#import "TableViewCell.h"
#import "Model.h"
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
-(void)loadView{
    [super loadView];//注意 使用loadview 这个方法必须要实现，不然会崩
    
    UIView *TopView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 320, 60)];
    UILabel *TopLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
 
    TopLable.text = @"首页";
    TopLable.textColor = [UIColor blackColor];
    TopLable.textAlignment = NSTextAlignmentCenter;

    UIButton *TopButton =[UIButton buttonWithType:UIButtonTypeCustom];
    TopButton.frame = CGRectMake(0, 0, 40, 40);
    [TopButton setImage:[UIImage imageNamed:@"btn_nav_invite@2x"] forState:UIControlStateNormal];
    
    [TopView addSubview:TopButton];
    [TopView addSubview:TopLable];
    
    UITableView *TableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, 320, 470)];
    [self.view addSubview:TopView];
    [self.view addSubview:TableView];
    UITabBar *bottomBar = [[UITabBar alloc] init];
    bottomBar.frame = CGRectMake(0, 530, 320, 40);
    TableView.dataSource = self;
    TableView.delegate = self;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //界面初始化尽量写在loadview方法里面
    

    data = [[NSMutableArray alloc]init];
    NSString *str1 = @"中国人思维定式：一提到女秘，就想到小蜜；一提到女官，就想到被窝； 一提到领导，就想到贪污；一提到贪官，就想到二奶； 一提到桑拿，就想到小姐；一提到办事，就想到关系； 一提到工程，就想到腐败；一提到垄断，就想到奸商； 一提到打假，就想到假打。";
    NSString *str2 = @"明明人在线，明明想说话，还要学隐身；明明很难过，明明很想哭，还要裂嘴笑；明明很孤单，明明很害怕，还要一个人；明明想见面，明明很期待，还要去拒绝；明明心很乱，明明想人陪，还要装沉默；明明舍不得，明明放不下，还要去放手；明明在心里，明明很在乎，还要无所谓！";
    NSString *str3 = @"Active long will be very tired, care about for a long time will crash!----主动久了会很累，在乎久了会崩溃!";
    NSString *str4 = @"可口可乐总裁曾说过：我们每个人都像小丑，玩着五个球。五个球是你的工作、健康、家庭、朋友、灵魂，这五个球只有一个是用橡胶做的，掉下去会弹起来，那就是工作。另外四个球都是用玻璃做的，掉了，就碎了。";
    
    //我要求你使用实体！！！！而不是这个，实体放数组里
    
    NSString *img0 = @"img0";
    NSString *img1 = @"img1";
    NSString *img2 = @"img2";
    NSString *img3 = @"img3";
    NSString *img4 = @"img4";
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@{@"str": str1,@"img": img0},
                                                     @{@"str": str2,@"img": img1},
                                                     @{@"str": str3,@"img": img2},
                                                     @{@"str": str4,@"img": img3},
                                                     @{@"str": str1,@"img": img4},
                                                     @{@"str": str2,@"img": img0}, nil];

    for (NSDictionary *dict in array) {
        NSString *str = [dict objectForKey:@"str"];
        NSString *img = [dict objectForKey:@"img"];
        Model *model = [[Model alloc] initWithString:str img:img];
        [data addObject:model];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Model *model = (Model *)[data objectAtIndex:indexPath.row];
    NSString *text = model.str;
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16.0], NSFontAttributeName,nil];
    CGRect size = [text boundingRectWithSize:CGSizeMake(320, 100220) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return size.size.height+100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellname = @"cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellname];
//    TableViewCell *cell = (TableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname];

        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    //config the cell
    
    
    //cell 这些内容处理 写在你的自定义cell里面
    Model *model = (Model *)[data objectAtIndex:indexPath.row];
    NSString *text = model.str;
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:cell.label.font,NSFontAttributeName,nil];
    CGRect size = [text boundingRectWithSize:CGSizeMake(320, 22000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    CGRect imgframe = CGRectMake(0, 0, size.size.width, size.size.height+100);
    CGRect conframe = CGRectMake(0, imgframe.size.height-40, 320, 40);
    CGRect lblframe = CGRectMake(0, imgframe.size.height-size.size.height-conframe.size.height, size.size.width, size.size.height);
    
    cell.imgview.frame = imgframe;
    cell.imgview.image = [UIImage imageNamed:model.img];
    
    cell.label.textAlignment = NSTextAlignmentNatural;
    cell.label.frame = lblframe;
    cell.label.text = text;
    
    
    cell.controlLabel.frame = conframe;
    
    //这个地方一定要注意 每次 滑动的时候 这个里都会走，我不停的滑动，然后cell会不停添加这些控件，会导致 cell里面的控件越来越多。
//    [cell.imgview addSubview:cell.controlLabel];
//    [cell.controlLabel addSubview:button1];
//    [cell.controlLabel addSubview:button2];
//    [cell.controlLabel addSubview:button3];
//    [cell.controlLabel addSubview:button4];
    
    return cell;
}

@end
