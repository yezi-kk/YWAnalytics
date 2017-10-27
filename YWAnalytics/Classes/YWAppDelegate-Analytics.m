//
//  YWAppDelegate-Analytics.m
//  Aspects
//
//  Created by Ye Wei on 2017/10/27.
//

#import "YWAppDelegate.h"
#import "XAspect.h"
#import <UMMobClick/MobClick.h>
#import "YWAnalyticsManager.h"

#define AtAspect Analytics
#define AtAspectOfClass YWAppDelegate
@classPatchField(YWAppDelegate)

AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions) {
    NSLog(@"成功加载友盟统计");
    
    YWAnalyticsManager *analyticsManager = [YWAnalyticsManager sharedInstance];
    
    if (analyticsManager.appKey) {
        UMConfigInstance.appKey = analyticsManager.appKey;
        UMConfigInstance.channelId = analyticsManager.channelID;
        [MobClick startWithConfigure:UMConfigInstance];
        
        [MobClick setLogEnabled:analyticsManager.analyticsLogEnabled];
        
        [YWAnalyticsManager analyticsViewController];
    }
    
    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}

@end
#undef AtAspectOfClass
#undef AtAspect

