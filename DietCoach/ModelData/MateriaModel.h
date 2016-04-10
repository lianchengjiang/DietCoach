//
//  MateriaModel.h
//  DietCoach
//
//  Created by jiangliancheng on 16/4/10.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BDReusableViewModel.h"

@interface MateriaModel : BDReusableViewModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *dosage;

+ (instancetype)modelWithName:(NSString *)name dosage:(NSString *)dosage;

@end
