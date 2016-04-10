//
//  AutoVideoViewController.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/10.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "AutoVideoViewController.h"
#import "LCPlayer.h"

@interface AutoVideoViewController ()
@property (nonatomic, strong) LCPlayer *player;

@end

@implementation AutoVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - getter
- (LCPlayer *)player
{
    if (_player) {
        return _player;
    }
    
    _player = [LCPlayer new];
    return _player;
}

@end
