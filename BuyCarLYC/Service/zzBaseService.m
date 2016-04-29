//
//  zzBaseService.m
//  baseFramework
//
//  Created by xuanwenchao on 14-2-13.
//  Copyright (c) 2014年 xuanwenchao. All rights reserved.
//


#import "zzBaseService.h"

@implementation NSString (compare)

-(NSComparisonResult)XCompare:(NSString*)other
{
    return [self compare:other options:NSForcedOrderingSearch];
}
@end


@interface zzBaseService ()
{
    AFHTTPRequestOperationManager *_requestManager;
    BOOL _isRequesting;//请求中
}


@end


@implementation zzBaseService

+ (instancetype)service
{
    return [[self alloc] init];
}




//添加通用参数
-(void) addCommonParamWithURL:(NSString*)url
{
    if(!_requestUrl)
    {
        _requestUrl = [[NSMutableString alloc] initWithCapacity:10];
    }
    [_requestUrl setString:url];
    
    if(!_dataParams)
    {
        _dataParams = [[NSMutableDictionary alloc] initWithCapacity:1];
    }
 
    
    [_dataParams removeAllObjects];
 
    //添加通用参数
    
    //用[NSDate date]可以获取系统当前时间
//    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    
    //URL编码
    //    NSString *urlEncodeStr = [currentDateStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    [self addExtParam:@"timestamp" withValue:currentDateStr];
    
}

//添加其它非通用参数
-(void) addExtParam:(NSString*) key withValue:(NSString*)value
{
    if(key && value){
        [_dataParams setObject:value forKey:key];
    }
}
-(void) addExtArrParam:(NSString*) key withValue:(NSArray*)arr
{
//    if(key && arr){
        [_dataParams setObject:arr forKey:key];
//    }
}

//发送异步网络请求
-(void) sendRequestGet
{
    if(_isRequesting){
        return;
    }
    _isRequesting = YES;
    
     NSString *urlEncodeStr = [_requestUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
     manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/plain",@"text/html",nil];
   
    
 
    [manager GET:urlEncodeStr parameters:_dataParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id jsonModelData = [self parseJson:responseObject];
        if(self.delegate && [self.delegate respondsToSelector:@selector(zzServiceDelegate_RequestSuccess:)]){
           [self.delegate zzServiceDelegate_RequestSuccess:jsonModelData];
          
        }
        
        
        _isRequesting = NO;

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(self.delegate && [self.delegate respondsToSelector:@selector(zzServiceDelegate_RequestFailure:)]){
            [self.delegate zzServiceDelegate_RequestFailure:error];
//           XBLog(@"错误信息%@,错误信息地址：%@",error,[error.userInfo objectForKey:@"NSErrorFailingURLKey"]);
            
         

            
        }
        _isRequesting = NO;
    }];
    
    //因此代理方法是可选的， 需要先判断是否实现了该方法再调用
    if(self.delegate && [self.delegate respondsToSelector:@selector(zzServiceDelegate_RequestStart)]){
        [self.delegate zzServiceDelegate_RequestStart];
    }
    
    
}


-(void) sendRequestPost
{
    if(_isRequesting){
        return;
    }
    _isRequesting = YES;

    XBLog(@"[%d]sendRequest post URL=%@",__LINE__,_requestUrl);
    NSString *urlEncodeStr = [_requestUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
  
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/plain",@"text/html",nil];
    [manager POST:urlEncodeStr parameters:_dataParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id jsonModelData = [self parseJson:responseObject];
        if(self.delegate && [self.delegate respondsToSelector:@selector(zzServiceDelegate_RequestSuccess:)]){
            [self.delegate zzServiceDelegate_RequestSuccess:jsonModelData];
        }
        _isRequesting = NO;

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(self.delegate && [self.delegate respondsToSelector:@selector(zzServiceDelegate_RequestFailure:)]){
            [self.delegate zzServiceDelegate_RequestFailure:error];
        }
        _isRequesting = NO;

    }];

    //因此代理方法是可选的， 需要先判断是否实现了该方法再调用
    if(self.delegate && [self.delegate respondsToSelector:@selector(zzServiceDelegate_RequestStart)]){
        [self.delegate zzServiceDelegate_RequestStart];
    }
}


//Json解析
-(id)parseJson:(id)jsonData
{
    if(jsonData){
    
    }
    return nil;
    
    //    return jsonData;
}

- (void)notificationAes:(NSString *)leiName
{
    [[NSNotificationCenter defaultCenter]postNotificationName:leiName object:nil];
}


-(NSString *)stampToken
{
    return [NSString stringWithFormat:@"%lld",(long long)[[NSDate date] timeIntervalSince1970] * 1000];
}

//生成签名参数
-(void)genSign
{
    
    NSArray *keysArr = [_dataParams allKeys];
    NSArray *sortArr = [keysArr sortedArrayUsingSelector:@selector(XCompare:)];
    
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:3];
    [string appendString:APPKEY];
    
    XBLog(@"参数＝＝＝＝＝＝＝＝＝＝");
    for(id item in sortArr){
//      [string appendFormat:@"%@%@",item,[_dataParams objectForKey:item]];
        [string appendFormat:@"%@",[_dataParams objectForKey:item]];
        XBLog(@"%@ = %@ ",item,[_dataParams objectForKey:item]);
    }
    [string appendString:APPSECRET]; //首尾要加上secret
    XBLog(@"加密参数数据 checkToken= %@ ",string);
    NSString *md5 = [[string md5Hash:32] lowercaseString];
    XBLog(@"md5 checkToken = %@",md5);
    [self addExtParam:@"checkToken" withValue:md5];
}

//请求中判断
-(BOOL)isRequesting
{
    return _isRequesting;
}  

@end


