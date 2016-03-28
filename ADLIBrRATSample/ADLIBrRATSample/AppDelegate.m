//
//  AppDelegate.m
//  ADLIBrRATSample
//
//  Created by mocoplex on 2014. 8. 6..
//  Copyright (c) 2014년 mocoplex. All rights reserved.
//

#import "AppDelegate.h"
#import <ADLIBrRAT/ALTracker.h>

#define ADLIB_RAT_KEY       @"INSERT_YOUR_RAT_KEY"

#define ADLIB_HYBRID_TAG    @"Hybrid"

@implementation AppDelegate

/*
// 하이브리드 앱 구성 시 웹뷰의 UserAgent 수정에 필요
// 웹페이지 스크립트 처리를 수정하지 않았다면 @"Hybrid" 키워드로 처리됨.
+ (void)initialize
{
    UIWebView* webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSString* secretAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    
    NSString *replaceAgent = [NSString stringWithFormat:@"%@ %@", secretAgent , ADLIB_HYBRID_TAG];
    NSDictionary *dic = @{@"UserAgent" : replaceAgent};
    [[NSUserDefaults standardUserDefaults] registerDefaults:dic];
}
*/

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    // Optional: set debug mode
    [[ALTracker sharedSingletonClass] setDebugMode:YES];
    
    // RAT Tracker initialize the install tracking. Replace with your app ID (ex. 560255520cf25399f0221e72)
    [[ALTracker sharedSingletonClass] initialize:ADLIB_RAT_KEY];
    
    return YES;
}

@end
