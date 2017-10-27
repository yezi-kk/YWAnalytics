//
//  YWAnalytics-AppDelegate.m
//  Aspects
//
//  Created by Ye Wei on 2017/10/27.
//

#import "AppDelegate.h"
#import "XAspect.h"
#import <UMMobClick/MobClick.h>
#import "JDAnalyticsManager.h"

#define AtAspect JDAnalytics
#define AtAspectOfClass JDAppDelegate
@classPatchField(JDAppDelegate)

AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions) {
    NSLog(@"成功加载友盟统计");
    
    JDAnalyticsManager *analyticsManager = [JDAnalyticsManager sharedInstance];
    
    if (analyticsManager.appKey) {
        UMConfigInstance.appKey = analyticsManager.appKey;
        UMConfigInstance.channelId = analyticsManager.channelID;
        [MobClick startWithConfigure:UMConfigInstance];
        
        [MobClick setLogEnabled:analyticsManager.analyticsLogEnabled];
    }
    
    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}

@end
#undef AtAspectOfClass
#undef AtAspect
