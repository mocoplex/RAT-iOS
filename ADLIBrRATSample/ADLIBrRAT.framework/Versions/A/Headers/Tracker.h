//
//  Tracker.h
//  ADLIBrRAT
//
//  Created by YongSun Kim on 2014. 7. 16..
//  Copyright (c) 2014년 mocoplex. All rights reserved.
//
//  Tracker version 1.0.4
//  Build time pm 16:00 07.21.2015

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tracker : NSObject {

}

@property (nonatomic, strong) NSString* user;
@property (nonatomic) BOOL debugMode;

+ (NSString *)getVersion;
+ (Tracker *)sharedSingletonClass;

- (void)initialize:(NSString *)_ratApiKey;

- (void)tagInit:(NSURL *)url;

- (void)view:(NSDictionary *)vdic;
- (void)cart:(NSDictionary *)vdic;
- (void)buy:(NSDictionary *)vdic;
- (void)customTag:(NSString *)tagName value:(NSDictionary *)vdic;
- (void)customTagExtra:(NSString *)tagName value:(NSDictionary *)vdic extra:(NSString *)vexra;

- (BOOL)parseWebViewRequest:(UIWebView*)wv with:(NSURLRequest *)request;
- (void)criteo_event:(NSArray*)events;

@end
