//
//  YWAnalyticsManager.h
//  Aspects
//
//  Created by Ye Wei on 2017/10/27.
//

#import <Foundation/Foundation.h>

@interface YWAnalyticsManager : NSObject

+ (YWAnalyticsManager *)sharedInstance;

//友盟统计配置 友盟key,chanel,是否开启SDK调试
@property (nonatomic, strong) NSString *appKey;
@property (nonatomic, strong) NSString *channelID;
@property (nonatomic, getter=isLogEnabled) BOOL analyticsLogEnabled;

//页面PV统计过滤数组，要统计的页面名称字符串数组，不统计的页面名称字符串数组
@property(nonatomic, strong) NSArray *prefixFilterArray;
@property(nonatomic, strong) NSArray *fileterNameArray;
@property(nonatomic, strong) NSArray *noFileterNameArray;

//统计进入跟离开viewController
+ (void)analyticsViewController;

// 同时在viewWillAppear和viewDidDisappeary调用,才能够获取正确的页面访问路径、访问深度（PV）的数据
+ (void)beginLogPageView:(__unsafe_unretained Class)pageView;
+ (void)endLogPageView:(__unsafe_unretained Class)pageView;

// 同时在viewWillAppear和viewDidDisappeary调用,才能够获取正确的页面访问路径、访问深度（PV）的数据
+ (void)beginLogPageViewName:(NSString *)pageViewName;
+ (void)endLogPageViewName:(NSString *)pageViewName;

/// 自定义事件
+ (void)logEvent:(NSString*)eventId;
+ (void)logEvent:(NSString*)eventId attributes:(NSDictionary *)attributes;

@end
