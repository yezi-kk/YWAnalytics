//
//  YWAnalyticsManager.m
//  Aspects
//
//  Created by Ye Wei on 2017/10/27.
//

#import "YWAnalyticsManager.h"
#import <UMMobClick/MobClick.h>
#import "Aspects.h"

@implementation YWAnalyticsManager

+ (YWAnalyticsManager *)sharedInstance {
    static YWAnalyticsManager* instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YWAnalyticsManager alloc] init];
    });
    return instance;
}

+ (void)analyticsViewController {
    //放到异步线程去执行
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, BOOL animated){
            UIViewController *controller = [info instance];
            BOOL filterResult = [weakSelf fileterWithControllerName:NSStringFromClass([controller class])];
            if (filterResult) {
                [weakSelf beginLogPageView:[controller class]];
            }
        } error:NULL];
        
        [UIViewController aspect_hookSelector:@selector(viewWillDisappear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, BOOL animated){
            UIViewController *controller = [info instance];
            BOOL filterResult=[weakSelf fileterWithControllerName:NSStringFromClass([controller class])];
            if (filterResult) {
                [weakSelf endLogPageView:[controller class]];
            }
        } error:NULL];
    });
}

+ (void)beginLogPageView:(__unsafe_unretained Class)pageView {
    [MobClick beginLogPageView:NSStringFromClass(pageView)];
}

+ (void)endLogPageView:(__unsafe_unretained Class)pageView {
    [MobClick endLogPageView:NSStringFromClass(pageView)];
}

+ (void)beginLogPageViewName:(NSString *)pageViewName {
    [MobClick beginLogPageView:pageViewName];
}

+ (void)endLogPageViewName:(NSString *)pageViewName {
    [MobClick endLogPageView:pageViewName];
}

+ (void)logEvent:(NSString*)eventId {
    [MobClick event:eventId];
}

+ (void)logEvent:(NSString*)eventId attributes:(NSDictionary *)attributes {
    [MobClick event:eventId attributes:attributes];
}

#pragma mark -- Private

+ (BOOL)fileterWithControllerName:(NSString *)controllerName {
    BOOL result = NO;
    
    YWAnalyticsManager *configManager = [YWAnalyticsManager sharedInstance];
    if (configManager.prefixFilterArray.count == 0
        && configManager.noFileterNameArray.count == 0
        && configManager.fileterNameArray.count==0) {
        return YES;
    }
    
    //判断是否在符合前缀里面
    if (configManager.prefixFilterArray) {
        for (NSString *prefixItem in configManager.prefixFilterArray) {
            if ([controllerName hasPrefix:prefixItem]) {
                result = YES;
                break;
            }
        }
    }
    //若有符合前缀则执行下面的内容 再进行判断当前页面是否要被省略掉的页面
    if (result) {
        if ([configManager.noFileterNameArray containsObject:controllerName]) {
            result = NO;
        }
    } else {
        if ([configManager.fileterNameArray containsObject:controllerName]) {
            result = YES;
        }
    }
    
    return result;
}

@end
