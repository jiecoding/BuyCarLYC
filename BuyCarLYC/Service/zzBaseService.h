//
//  zzBaseService.h
//  baseFramework
//
//  Created by xuanwenchao on 14-2-13.
//  Copyright (c) 2014年 xuanwenchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@protocol zzBaseServiceDelegate;

@interface zzBaseService : NSObject
{
    NSMutableString     *_requestUrl;
    NSMutableDictionary *_dataParams;
}
-(void) addExtArrParam:(NSString*) key withValue:(NSArray*)arr;

+ (instancetype)service;

//添加通用参数
-(void) addCommonParamWithURL:(NSString*)url;

//添加其它非通用参数
-(void) addExtParam:(NSString*)key withValue:(NSString*)value;

//发送异步网络请求
-(void) sendRequestGet;
-(void) sendRequestPost;

/*!
 *  @Author robin, 14-11-24 13:11:10
 *
 *  @brief  时间戳
 *
 *  @return
 */
-(NSString *)stampToken;

//生成签名参数
-(void)genSign;

//Json解析
-(id)parseJson:(id)jsonData;

//请求中判断
-(BOOL)isRequesting;

@property(nonatomic,weak)   id <zzBaseServiceDelegate>   delegate;

@end

@protocol zzBaseServiceDelegate <NSObject>

@optional

-(void)zzServiceDelegate_RequestStart;
-(void)zzServiceDelegate_RequestSuccess:(id)object;
-(void)zzServiceDelegate_RequestFailure:(NSError *)error;
@end