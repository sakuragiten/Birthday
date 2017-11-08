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

@end

@implementation GSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"DaQqqqqq";
    
//    self.view.backgroundColor = [UIColor randomColor];

//    [[GSAudioTool sharedAudioTool] playBirthSong];
//    [self showBirthdayView];
    
    
    UIButton *testBtn = [[UIButton alloc] init];
    [testBtn setTitle:@"test" forState:UIControlStateNormal];
    [testBtn setBackgroundColor:[UIColor honeydew]];
    [testBtn setTitleColor:[UIColor seaGreen] forState:UIControlStateNormal];
    
    [testBtn addTarget:self action:@selector(showBirthdayView) forControlEvents:UIControlEventTouchUpInside];
    testBtn.frame = CGRectMake(20, 70, 100, 40);
    
    [self.view addSubview:testBtn];
    
//    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 200, 300, 300)];
//    
//    UIImage *image = [[GSTool sharedTool] qrCoderWithContent:@"<html><body><h1>我的第一个标题</h1><p>我的第一个段落。</p></body></html>"];
//    
//    imageView.image = image;
//    
//    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
//    
//    [self.view addSubview:imageView];
//
    
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
