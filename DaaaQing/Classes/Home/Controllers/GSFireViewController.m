//
//  GSFireViewController.m
//  DaaaQing
//
//  Created by Fireloli on 17/10/30.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSFireViewController.h"

#import "GSFireStar.h"
#import "GSCakeView.h"
#import "GSExplosionLayer.h"
#import "GSFireworksLayer.h"
#import "GSTextLayer.h"

@interface GSFireViewController ()

@property (nonatomic, strong) GSFireStar *star;

@property (nonatomic, strong) GSExplosionLayer *explosionLayer;

@property (nonatomic, strong) GSCakeView *cakeView;

@property (nonatomic, strong) GSTextLayer *nameLayer;

@property (nonatomic, strong) GSTextLayer *wishLayer;

@end

@implementation GSFireViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (void)setupUI
{
    //隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES];
    
    //背景颜色
    self.view.backgroundColor = [UIColor blackColor];
    
//    [self.view addSubview:self.cakeView];
//    [self.cakeView showWithAnimation];
//    
//    GSFireworksLayer *spark = [GSFireworksLayer fireworksLlayer];
//    spark.position = CGPointMake(self.view.width * 0.5, self.view.height);
//    [self.view.layer addSublayer:spark];
//    
//    [self.view.layer addSublayer:self.nameLayer];
//    [self.view.layer addSublayer:self.wishLayer];

//    return;/
    
    //五角星⭐️
    self.star.frame = CGRectMake(SCREEN_WIDTH - kStarWidth, SCREEN_HEIGHT - kStarWidth, kStarWidth, kStarWidth);
    [self.view addSubview:_star];
    
    [_star animationStart]; //启动动画
    
    GSWeakSelf(weakSelf)
    [_star starWillCatapult:^{
        [weakSelf.explosionLayer boomEffect];
        CGPoint endPoint = CGPointMake(SCREEN_WIDTH * 0.5, 80);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.explosionLayer.position = endPoint;
        });
    }];
    [_star starDidDisappear:^(CGPoint endPoint) {
        
        [weakSelf.explosionLayer boomEffect];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.view addSubview:weakSelf.cakeView];
            [weakSelf.cakeView showWithAnimation];

            [weakSelf.view.layer addSublayer:weakSelf.nameLayer];
            [weakSelf.view.layer addSublayer:weakSelf.wishLayer];
            
            [weakSelf.cakeView animationEndWithCompletionHandle:^{
                //蛋糕动画结束
                GSFireworksLayer *spark = [GSFireworksLayer fireworksLlayer];
                spark.position = CGPointMake(weakSelf.view.width * 0.5, weakSelf.view.height);
                [weakSelf.view.layer addSublayer:spark];
            }];
        });
    }];
    
    //添加爆炸效果
    [self.view.layer addSublayer:self.explosionLayer];

    
    
}

/** 隐藏电池栏 */
- (BOOL)prefersStatusBarHidden
{
    return YES;
}




#pragma mark - lazy load

- (GSFireStar *)star
{
    if (!_star) {
        _star = [[GSFireStar alloc] init];
        
    }
    
    return _star;
}

- (GSExplosionLayer *)explosionLayer
{
    if (!_explosionLayer) {
        _explosionLayer = [GSExplosionLayer explosionLayerAtPosition:CGPointMake(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT - kStarWidth * 0.5)];
    }
    return _explosionLayer;
}

- (GSCakeView *)cakeView
{
    if (!_cakeView) {
        _cakeView = [GSCakeView cakeView];
        _cakeView.frame = self.view.bounds;
    }
    
    return _cakeView;
}


- (GSTextLayer *)nameLayer
{
    if (!_nameLayer) {
        CGFloat width = 100;
        CGRect rect = CGRectMake((SCREEN_WIDTH - width) * 0.5, 100, width, 60);
        _nameLayer = [GSTextLayer layerWithText:@"十八岁" rect:rect];
    }
    return _nameLayer;
}

- (GSTextLayer *)wishLayer
{
    if (!_wishLayer) {
        CGFloat width = 200;
        CGRect rect = CGRectMake((SCREEN_WIDTH - width) * 0.5, self.view.height - 200, width, 60);
        _wishLayer = [GSTextLayer layerWithText:@"生日快乐" rect:rect];
    }
    return _wishLayer;
}

@end
