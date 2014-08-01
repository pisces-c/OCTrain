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
        
        self.controlLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
        self.controlLabel.backgroundColor = [UIColor whiteColor];
        
        self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button4 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _button1.backgroundColor = [UIColor whiteColor];
        _button2.backgroundColor = [UIColor whiteColor];
        _button3.backgroundColor = [UIColor whiteColor];
        _button4.backgroundColor = [UIColor whiteColor];
        
        [_button1 setImage:[UIImage imageNamed:@"comment_like_normal@2x"] forState:UIControlStateNormal];
        [_button2 setImage:[UIImage imageNamed:@"list_comment@2x"] forState:UIControlStateNormal];
        [_button3 setImage:[UIImage imageNamed:@"list_private_letter_disable@2x"] forState:UIControlStateNormal];
        [_button4 setImage:[UIImage imageNamed:@"list_more_black@2x"] forState:UIControlStateNormal];
        
        _button1.frame = CGRectMake(0, 0, 40, 40);
        _button2.frame = CGRectMake(80, 0, 40, 40);
        _button3.frame = CGRectMake(160, 0, 40, 40);
        _button4.frame = CGRectMake(240, 0, 40, 40);
        
        [self addSubview:self.imgview];
        [self addSubview:self.label];
//        [self addSubview:self.controlLabel];
        [self.imgview addSubview:self.controlLabel];
        [self.controlLabel addSubview:self.button1];
        [self.controlLabel addSubview:self.button2];
        [self.controlLabel addSubview:self.button3];
        [self.controlLabel addSubview:self.button4];

        
        
        
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
