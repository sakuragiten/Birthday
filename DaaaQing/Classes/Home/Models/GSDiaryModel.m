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
             @"我一會看代碼，一會看你！",
             @"最美的不是下雨天，而是和你一起躲過雨的人行通道。",
             @"海上月是天上月,眼前人是心上人.",
             @"落葉在秋風中打旋，夕陽熔成一爐金子.\n在這個悲傷的季節，我又開始想念你了.",
             @"//爱的for循环\nfor(;;;)love(u);",
             @"when works get in the way of shaving....\nwhen you gets in the way of working...",
             @"你離職以後，可樂都能泛起回憶.",
             @"關於深圳，我所有的記憶都是你！",
             @"等不到天黑,煙火不會太完美。\n             喜歡你所喜歡的林俊傑",
             @"我沒有在看跳舞，我在看你.",
             @"花很漂亮，裙子很漂亮，你也很漂亮。\n可惜拍照的不是我",
             @"遠遠偷拍在等我的你...",
             @"和你一起看盛華大廈加班的十五樓.",
             @"從十五樓看路過盛華大廈的你..",
             @"窗台上滴落的雨滴\n轻敲着伤心 凄美而动听\n而我听见下雨的声音",
             @"換種方式搭訕你..意不意外？",
             @"想要放，放不掉，泪在飘...",
             @"路过莲塘，仿佛路过你",
             @"喜欢深圳的海，忘不了盐田的海.",
             @"一米六的大个。。",
             @"想什么呢?",
             @"Queen's Road East。。。",
             @"天青色等烟雨，而我在等你.",
             @"you are the apple of my eye",
             @"感谢我不可以,住进你的眼睛.\n所以才能,拥抱你的背影.\n有再多的遗憾,\n用来牢牢记住,不完美的所有美丽.",
             @"要帶我去吃的炒雞可愛終無機會、",
             @"你所推薦的南昌拌粉再也沒有以前的味道、",
             @"閃閃惹人愛",
             @"- 你在賣門嗎？？\n- 本來就很萌。",
             @"傘下的戀人中，不再有你我手牽手，一切過了太久.",
             @"我希望你忘了我，在春天的某一刻，花開了漫山遍野，可選擇的有許多....我要化作一團烈火，在熄滅的那一刻，風是我的伴侶，吹散了我的墮落...我想我是愛你的，在心裡的小角落，告別了青春年少，也許你該忘了我....",
             @"我多希望在茶水間的角落，早班的電梯口，食堂的飯桌旁，一轉身就能和你遇見。",
             @"我想，如果不是你在，再美的彩虹對我來說，又有什麼值得讓人想起。",
             @"生命中曾擁有過的所有燦爛，終究都需要用寂寞償還。",
             @"我知道你白癡，傻帽，自我否定，然而，我愛你。",
             @"草在結它的種子，風在搖它的葉子。我們站著，不說話，就十分美好。",
             @"你沒有如期歸來，而這正是離別的意義。",
             @"你最可愛\n說時來不及思索\n但思索之後\n還是這樣說",
             @"我遇見你\n我記得你\n這座城市天生適合戀愛\n你天生適合我的靈魂",
             @"如果不是舒雅請吃飯，我還不知道這個地方叫KKMall\n如果不是你帶我去過，我又怎會感到悲傷..",
             @"Having breakfirst where you sat",
             @"沒有你的里外，我只能反復望著窗外.",
             @"我曾以為你在深圳你是我最思念的人，現在我要離開了，才發現的確如此。",
             @"一望可相見，\n一步如重城.\n所愛隔山海，\n山海不可平。",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"",
             @"相見才是親，突然好想妳。",
             @"读完了依赖，我很快就离开."];
}

@end
