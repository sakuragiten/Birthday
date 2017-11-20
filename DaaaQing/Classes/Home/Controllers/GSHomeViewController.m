//
//  GSHomeViewController.m
//  DaaaQing
//
//  Created by Fireloli on 17/10/19.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSHomeViewController.h"
#import "GSBirthdayView.h"

#import "GSDiaryController.h"
@interface GSHomeViewController ()
@property (nonatomic, assign) BOOL aletShow;
@end

@implementation GSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    [self showBirthdayView];
    [self setupUI];
    
   


//    self.title = @"DaQqqqqq";

    
//    self.view.backgroundColor = [UIColor randomColor];

    [[GSAudioTool sharedAudioTool] playBirthSong];
//    [self showBirthdayView];
    

    
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


- (void)setupUI
{
    self.title = @"Love U";
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"da_bg.jpg"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    
    YYLabel *label = [YYLabel new];
    label.attributedText = [self attributeTextAtFirst];
    label.frame = CGRectMake(0, 100, SCREEN_WIDTH, 100);
    label.textAlignment = NSTextAlignmentCenter;
    label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    label.numberOfLines = 0;
    
    [self.view addSubview:label];
}


- (NSAttributedString *)attributeTextAtFirst
{
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"wonderful time with you! "];
        one.yy_font = [UIFont boldSystemFontOfSize:14];
        one.yy_color = RGBAlpha(255, 255, 255, 0.5);
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 5;
        one.yy_textShadow = shadow;
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"and"];
        one.yy_font = [UIFont boldSystemFontOfSize:14];
        one.yy_color = RGBAlpha(255, 255, 255, 0.5);
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 5;
        one.yy_textShadow = shadow;
        [text appendAttributedString:one];
//        [text appendAttributedString:[self padding]];
    }
    {
        
        //        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"if i were you , i would click here!"];
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@" love "];
        one.yy_font = [UIFont boldSystemFontOfSize:18];
        one.yy_color = RGBAlpha(255, 255, 255, 1);
        
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 5;
        one.yy_textShadow = shadow;
        
        YYTextShadow *shadow0 = [YYTextShadow new];
        shadow0.color = [UIColor colorWithWhite:0.000 alpha:0.20];
        shadow0.offset = CGSizeMake(0, -1);
        shadow0.radius = 1.5;
        YYTextShadow *shadow1 = [YYTextShadow new];
        shadow1.color = [UIColor colorWithWhite:1 alpha:0.99];
        shadow1.offset = CGSizeMake(0, 1);
        shadow1.radius = 1.5;
        shadow0.subShadow = shadow1;
        
        YYTextShadow *innerShadow0 = [YYTextShadow new];
        innerShadow0.color = [UIColor colorWithRed:0.851 green:0.311 blue:0.000 alpha:0.780];
        innerShadow0.offset = CGSizeMake(0, 1);
        innerShadow0.radius = 1;
        
        YYTextHighlight *highlight = [YYTextHighlight new];
        [highlight setColor:[UIColor colorWithRed:1.000 green:0.795 blue:0.014 alpha:1.000]];
        [highlight setShadow:shadow0];
        [highlight setInnerShadow:innerShadow0];
        GSWeakSelf(weakSelf)
        highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            [weakSelf segueToDiary];
        };
        [one yy_setTextHighlight:highlight range:one.yy_rangeOfAll];
        
        [text appendAttributedString:one];
        
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"you forever!"];
        one.yy_font = [UIFont boldSystemFontOfSize:14];
        one.yy_color = RGBAlpha(255, 255, 255, 0.5);
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 5;
        one.yy_textShadow = shadow;
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"but do you know \"love\" can be clicked."];
        one.yy_font = [UIFont boldSystemFontOfSize:14];
        one.yy_color = RGBAlpha(255, 255, 255, 0.5);
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 5;
        one.yy_textShadow = shadow;
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    
    
=======
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
>>>>>>> d97cd67b2c774df5e64075a57865d0f4e681dcc5
    
    return text;
}
<<<<<<< HEAD

- (NSAttributedString *)padding {
    NSMutableAttributedString *pad = [[NSMutableAttributedString alloc] initWithString:@"\n\n"];
    pad.yy_font = [UIFont systemFontOfSize:4];
    return pad;
}
- (void)showBirthdayView
{
    GSBirthdayView *view = [[GSBirthdayView alloc] init];
    [view show];
    

//    

 
}

- (void)segueToDiary
{
=======
- (void)showBirthdayView
{
    //    GSBirthdayView *view = [[GSBirthdayView alloc] init];
    //    [view show];
    
    //    GSFireViewController *vc = [[GSFireViewController alloc] init];
    //    [self.navigationController pushViewController:vc animated:YES];
    //
    
>>>>>>> d97cd67b2c774df5e64075a57865d0f4e681dcc5
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
