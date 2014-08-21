//
//  AppDelegate.m
//  ADLIBrRATSample
//
//  Created by YongSun Kim on 2014. 8. 6..
//  Copyright (c) 2014년 mocoplex. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <ADLIBrRAT/Tracker.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Optional: set debug mode
    [[Tracker sharedSingletonClass] setDebugMode:YES];
    
    // RAT Tracker initialize the install tracking. Replace with your app ID (ex. 53f473e10cf2bf99ebbfeb34)
    [[Tracker sharedSingletonClass] initialize:@"INSERT_YOUR_ADLIB_RAT_KEY"];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    NSLog(@"delegate openURL : %@", [url absoluteString]);
    
    @try {
    
        // RAT Tracker initialize the tag tracking
        [[Tracker sharedSingletonClass] tagInit:url];
        
    
        NSDictionary *infoList = [[NSBundle mainBundle]infoDictionary];
    
        NSDictionary *urlScheme = [[infoList valueForKey:@"CFBundleURLTypes"] objectAtIndex:0];
    
        NSString * urlSchemeName = [[urlScheme valueForKey:@"CFBundleURLSchemes"] objectAtIndex:0];
    
        if ([[url scheme] isEqualToString:urlSchemeName]) {
        
            NSString *query = [url query];
        
            if([[url host] rangeOfString:@"view"].location != NSNotFound
                    && [query rangeOfString:@"pid="].location != NSNotFound) {
            
                NSArray *listItems = [query componentsSeparatedByString:@"&"];

                for (int i=0; i<[listItems count]; i++) {
                    if ([[listItems objectAtIndex:i] rangeOfString:@"pid="].location != NSNotFound) {
                        NSArray *listItems2 = [[listItems objectAtIndex:i] componentsSeparatedByString:@"="];
                        NSString *lastObj = [listItems2 lastObject];
                    
                        NSString *item = [lastObj stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                    
                        ViewController* mainController = (ViewController*)  self.window.rootViewController;
                        [mainController loadDetail:item];
                    
                        break;
                    }
                }
            }
        }
        
    }
    @catch (NSException *exception) {
    }
    
    return YES;
}

@end
