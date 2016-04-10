//
//  MaterialTableViewCell.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/10.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "MaterialTableViewCell.h"

@interface MaterialTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dosageLabel;

@end

@implementation MaterialTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - public
- (void)updateUIWithModel:(MateriaModel *)model;
{
    self.nameLabel.text = model.name;
    self.dosageLabel.text = model.dosage;
}

@end
