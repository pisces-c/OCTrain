//
//  TableViewCell.m
//  NoSecret
//
//  Created by 成城 on 14-7-24.
//  Copyright (c) 2014年 cc. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

        self.imgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 10)];
//        self.controlView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];

//        self.imgview.image = [UIImage imageNamed:@"img0"];
        
//        self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.button4 = [UIButton buttonWithType:UIButtonTypeCustom];
        
//        self.button1.backgroundColor = [UIColor blackColor];
//        self.button2.backgroundColor = [UIColor blackColor];
//        self.button3.backgroundColor = [UIColor blackColor];
//        self.button4.backgroundColor = [UIColor blackColor];
        
//        self.button1.frame = CGRectMake(0, 130, 80, 40);
//        self.button2.frame = CGRectMake(80, 130, 80, 40);
//        self.button3.frame = CGRectMake(160, 130, 80, 40);
//        self.button4.frame = CGRectMake(240, 130, 80, 40);

//        [self.button1 setTitle:@"A" forState:UIControlStateNormal];
//        [self.button2 setTitle:@"B" forState:UIControlStateNormal];
//        [self.button3 setTitle:@"C" forState:UIControlStateNormal];
//        [self.button4 setTitle:@"D" forState:UIControlStateNormal];
        
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 10)];
        self.label.backgroundColor = [UIColor clearColor];
        self.label.font = [UIFont systemFontOfSize:16.0];
        self.label.lineBreakMode = NSLineBreakByWordWrapping;
        self.label.numberOfLines = 0;
        self.label.textAlignment = NSTextAlignmentLeft;
        
        self.controlLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
        self.controlLabel.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.imgview];
        [self addSubview:self.label];
        [self addSubview:self.controlLabel];
//        [self addSubview:self.controlView];
//        [self.label addSubview:self.button1];
//        [self.label addSubview:self.button2];
//        [self.label addSubview:self.button3];
//        [self.label addSubview:self.button4];

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
