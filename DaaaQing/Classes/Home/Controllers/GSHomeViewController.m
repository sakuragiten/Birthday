//
//  GSHomeViewController.m
//  DaaaQing
//
//  Created by Fireloli on 17/10/19.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSHomeViewController.h"
#import "GSBirthdayView.h"
#import "GSFireViewController.h"
#import "GSDiaryController.h"
@interface GSHomeViewController ()
@property (nonatomic, assign) BOOL aletShow;
@end

@implementation GSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.title = @"DaQqqqqq";
    
//    self.view.backgroundColor = [UIColor randomColor];

//    [[GSAudioTool sharedAudioTool] playBirthSong];
//    [self showBirthdayView];
    
    [self shakeToChangeEnvironmentEnable:YES];
    
//    UIButton *testBtn = [[UIButton alloc] init];
//    [testBtn setTitle:@"test" forState:UIControlStateNormal];
//    [testBtn setBackgroundColor:[UIColor honeydew]];
//    [testBtn setTitleColor:[UIColor seaGreen] forState:UIControlStateNormal];
//
//    [testBtn addTarget:self action:@selector(showBirthdayView) forControlEvents:UIControlEventTouchUpInside];
//    testBtn.frame = CGRectMake(20, 70, 100, 40);
//
//    [self.view addSubview:testBtn];
//
////
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 200, 300, 300)];
//
//    UIImage *image = [[GSTool sharedTool] qrCoderWithContent:@"201709250047$421127001008GB00665F00010089$鄂(2017)黄梅不动产权第0009713号$F70034CB5FF56F63C3A8D9C1"];
//
//    imageView.image = image;
//
//    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
//
//    [self.view addSubview:imageView];
//
    
}
- (void)shakeToChangeEnvironmentEnable:(BOOL)enable
{
    //设置摇一摇功能
    [UIApplication sharedApplication].applicationSupportsShakeToEdit = enable;
    
    //并让自己成为第一响应者
    [self becomeFirstResponder];
}

//开始摇动
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (_aletShow) return; //弹窗已经弹出
    _aletShow = YES;
    NSNumber *environment = [[NSUserDefaults standardUserDefaults] objectForKey:@"userEnvironment"];
    NSArray *environmentArray = @[@"测试环境",@"开发环境",@"灰度环境",@"正式环境"];
    NSString *currentEnvironment = environmentArray[environment.integerValue];
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"当前环境:%@", currentEnvironment] message:@"切换不同环境需要重新登录哦😀" preferredStyle:UIAlertControllerStyleAlert];
    for (int i = 0; i < environmentArray.count; i++) {
        NSString *e = environmentArray[i];
        if (i == environment.integerValue) {
            e = [e stringByAppendingString:@"(当前)"];
        }
        UIAlertAction *action = [UIAlertAction actionWithTitle:e style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            _aletShow = NO;
            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:i] forKey:@"userEnvironment"];
            
            // to-do : 切换环境
        }];
        [alertVC addAction:action];
    }
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        _aletShow = NO;
    }];
    
    [alertVC addAction:cancel];
    
    [self presentViewController:alertVC animated:YES completion:nil];
    
}
- (void)showBirthdayView
{
    //    GSBirthdayView *view = [[GSBirthdayView alloc] init];
    //    [view show];
    
    //    GSFireViewController *vc = [[GSFireViewController alloc] init];
    //    [self.navigationController pushViewController:vc animated:YES];
    //
    
    GSDiaryController *vc = [[GSDiaryController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
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






@end
