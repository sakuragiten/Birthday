//
//  GSDiaryModel.m
//  DaaaQing
//
//  Created by gongsheng on 2017/11/10.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSDiaryModel.h"

@implementation GSDiaryModel


+ (NSArray *)dqModelArray
{
    NSArray *contentArray = [self contentArray];
    NSMutableArray *temp = [NSMutableArray array];
    for (int i = 0; i < 25; i ++) {
        
        GSDiaryModel *model = [[GSDiaryModel alloc] init];
        
        NSString *imageName = [NSString stringWithFormat:@"dq_%d.jpg", i];
        model.imageName = imageName;
        
        model.content = contentArray[i];
        
        [temp addObject:model];
    }
    
    return temp;
}


+ (NSArray *)contentArray
{
    return @[@"You never know excited I was \n the first time dating you!。",
             @"我以为你很高，但让我没想到的是你还很好！",
             @"我曾满目忧愁，万千感慨。是你给我带来希望，从此光芒万丈。",
             @"海上月是天上月,眼前人是心上人.",
             @"好一朵小花，好一个姑娘，\n如果不是遇见你，花还是花，但我却不再是我",
             @"Mountain top, there were you, there was my world!",
             @"落叶在秋风中打旋，夕阳熔成一炉金子.\n在这个悲伤的季节，我又开始想念你了.",
             @"我喜欢英雄联盟，更喜欢打LOL的你。",
             @"I enjoy the time there, looking at the shoreless sea , but the most beautiful scenery were you with the  cute swimsuit.",
             @"你带我看的第一场演唱会，万人齐唱，星光璀璨，只是因为你才变得难忘.",
             @"每一次的高山之上，心旷神怡.\n只因有你，即便很懒，我依然对大山充满热情",
             @"骑车的样子很酷，哈哈！",
             @"我遇见你\n我记得你\n这座城市天生适合恋爱\n你天生适合我的灵魂。",
             @"美丽的澳门，美丽的你。",
             @"总是想带你运动，太懒了。",
             @"去北京的飞机上，第一次与你的远行...",
             @"景山公园，与你一起看大清王朝。",
             @"我知道你白痴，傻帽，自我否定，然而，我爱你。。.",
             @"你最喜欢向日葵，我最喜欢你。",
             @"北海公园，即便有过吵架，留在记忆里的还是最好的你",
             @"你最可爱\n说时来不及思索\n但思索之后\n还是这样说",
             @"东莞的花园，你站在那就很美好。",
             @"可能你不记得，这是你第一次做鱼香肉丝给我吃.",
             @"天真如你。突然好想你。",
             @"星光璀璨，不及你"];
}

@end
