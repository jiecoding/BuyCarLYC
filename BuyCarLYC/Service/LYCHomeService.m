//
//  LYCHomeService.m
//  BuyCarLYC
//
//  Created by laiyongche on 16/4/29.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import "LYCHomeService.h"
/*
 http://api.tool.chexun.com/mobile/buyCarSeriesInfo.do?pageNo=1&pageSize=5&carLevel=3&cityId=1
 */
#define TestUrl @"http://api.tool.chexun.com/mobile/buyCarSeriesInfo.do?"
@implementation LYCHomeService
-(void)req{
    //    [self addCommonParamWithURL:ChongZhiQianXinXi];
    [self addCommonParamWithURL:TestUrl];
    
    
    [self addExtParam:@"pageNo"     withValue:@"1"];
     
    
    [self addExtParam:@"pageSize"   withValue:@"5"];
    
        [self addExtParam:@"carLevel"   withValue:@"3"];
    
        [self addExtParam:@"cityId"   withValue:@"1"];
    
    [self genSign];//生成签名
    [self sendRequestGet];
    
}

-(id)parseJson:(id)jsonData
{
    
    NSLog(@"testzzzz:%@",jsonData);
    if(jsonData){
        
     }
    
    return nil;
}
@end
