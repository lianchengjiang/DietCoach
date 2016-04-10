//
//  MateriaModel.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/10.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "MateriaModel.h"

@implementation MateriaModel
+ (instancetype)modelWithName:(NSString *)name dosage:(NSString *)dosage;
{
    MateriaModel *model = [MateriaModel new];
    model.name = name;
    model.dosage = dosage;
    return model;
}
@end
