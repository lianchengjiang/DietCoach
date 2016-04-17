//
//  AutoVideoTableViewCell.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/10.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "AutoVideoTableViewCell.h"
#import "ReactiveCocoa.h"


@interface AutoVideoTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *headLabel;
@property (weak, nonatomic) IBOutlet UILabel *tailLabel;

@end

@implementation AutoVideoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    RAC(self.headLabel, text) = RACObserve(self, model.headString);
    RAC(self.tailLabel, text) = RACObserve(self, model.tailString);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
