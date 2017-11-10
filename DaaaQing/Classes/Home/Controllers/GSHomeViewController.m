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

@end

@implementation GSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self showBirthdayView];
    [self setupUI];
    
//    self.view.backgroundColor = [UIColor randomColor];

//    [[GSAudioTool sharedAudioTool] playBirthSong];
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
    self.title = @"DaQqqqqq";
    
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
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Hello World! "];
        one.yy_font = [UIFont boldSystemFontOfSize:14];
        one.yy_color = [UIColor whiteColor];
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 5;
        one.yy_textShadow = shadow;
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Hello My Girl!"];
        one.yy_font = [UIFont boldSystemFontOfSize:14];
        one.yy_color = [UIColor whiteColor];
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 5;
        one.yy_textShadow = shadow;
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    
    {
        
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"if i were you , i would click here!"];
        one.yy_font = [UIFont boldSystemFontOfSize:14];
        one.yy_color = [UIColor whiteColor];
        
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
    
    return text;
}

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
