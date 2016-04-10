//
//  ManualVideoTableViewCell.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/10.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "ManualVideoTableViewCell.h"

@interface ManualVideoTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ManualVideoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateUIWithName:(NSString *)name
{
    self.nameLabel.text = name;
}

@end
