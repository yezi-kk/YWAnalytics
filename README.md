# YWAnalytics

[![CI Status](http://img.shields.io/travis/yezi-kk/YWAnalytics.svg?style=flat)](https://travis-ci.org/Ye Wei/YWAnalytics)
[![Version](https://img.shields.io/cocoapods/v/YWAnalytics.svg?style=flat)](http://cocoapods.org/pods/YWAnalytics)
[![License](https://img.shields.io/cocoapods/l/YWAnalytics.svg?style=flat)](http://cocoapods.org/pods/YWAnalytics)
[![Platform](https://img.shields.io/cocoapods/p/YWAnalytics.svg?style=flat)](http://cocoapods.org/pods/YWAnalytics)

## About
对友盟SDK基于AOP模式进行封装

## Installation

YWAnalytics is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YWAnalytics'
```
## Use

* 1.AppDelegate 继承 YWAppDelegate
* 2.配置友盟参数

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    YWAnalyticsManager *anlyticsManager = [YWAnalyticsManager sharedInstance];
    anlyticsManager.appKey = @"xxxxxxxx";
    anlyticsManager.channelID = @"AppStore";
    anlyticsManager.prefixFilterArray = @[@"YW"];
    
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
```

## Author

Ye Wei, 276208561@qq.com

## License

YWAnalytics is available under the MIT license. See the LICENSE file for more info.
