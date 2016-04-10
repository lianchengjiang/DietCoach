//
//  MaterialTableViewCell.h
//  DietCoach
//
//  Created by jiangliancheng on 16/4/10.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MateriaModel.h"

@interface MaterialTableViewCell : UITableViewCell

- (void)updateUIWithModel:(MateriaModel *)model;

@end
