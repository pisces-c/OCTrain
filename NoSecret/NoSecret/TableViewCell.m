//
//  TableViewCell.m
//  NoSecret
//
//  Created by 成城 on 14-7-24.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import "TableViewCell.h"
#import "Model.h"
@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

        self.imgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 10)];

        
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 10)];
        self.label.backgroundColor = [UIColor clearColor];
        self.label.font = [UIFont systemFontOfSize:16.0];
        self.label.lineBreakMode = NSLineBreakByWordWrapping;
        self.label.numberOfLines = 0;
        self.label.textAlignment = NSTextAlignmentLeft;
        
        self.controlLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
        self.controlLabel.backgroundColor = [UIColor whiteColor];
        
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button1.backgroundColor = [UIColor whiteColor];
        button2.backgroundColor = [UIColor whiteColor];
        button3.backgroundColor = [UIColor whiteColor];
        button4.backgroundColor = [UIColor whiteColor];
        
        [button1 setImage:[UIImage imageNamed:@"comment_like_normal@2x"] forState:UIControlStateNormal];
        [button2 setImage:[UIImage imageNamed:@"list_comment@2x"] forState:UIControlStateNormal];
        [button3 setImage:[UIImage imageNamed:@"list_private_letter_disable@2x"] forState:UIControlStateNormal];
        [button4 setImage:[UIImage imageNamed:@"list_more_black@2x"] forState:UIControlStateNormal];
        
        button1.frame = CGRectMake(0, 0, 40, 40);
        button2.frame = CGRectMake(80, 0, 40, 40);
        button3.frame = CGRectMake(160, 0, 40, 40);
        button4.frame = CGRectMake(240, 0, 40, 40);
        
        [self addSubview:self.imgview];
        [self addSubview:self.label];
        [self addSubview:self.controlLabel];
        [self.imgview addSubview:self.controlLabel];
        [self.controlLabel addSubview:button1];
        [self.controlLabel addSubview:button2];
        [self.controlLabel addSubview:button3];
        [self.controlLabel addSubview:button4];

        
        
//        Model *model = (Model *)[data objectAtIndex:indexPath.row];
//        NSString *text = model.str;
//        
//        NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:cell.label.font,NSFontAttributeName,nil];
//        CGRect size = [text boundingRectWithSize:CGSizeMake(320, 22000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
//        
//        CGRect imgframe = CGRectMake(0, 0, size.size.width, size.size.height+100);
//        CGRect conframe = CGRectMake(0, imgframe.size.height-40, 320, 40);
//        CGRect lblframe = CGRectMake(0, imgframe.size.height-size.size.height-conframe.size.height, size.size.width, size.size.height);
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
