//
//  Tracker.h
//  ADLIBrRAT
//
//  Created by mocoplex on 2014. 7. 16..
//  Copyright (c) 2014 mocoplex. All rights reserved.
//
//  Tracker version 1.0.6
//  Build time pm 16:00 07.21.2015

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ALTracker : NSObject {

}

@property (nonatomic) BOOL debugMode;
@property (nonatomic, copy, readonly) NSString *ratApiKey;

+ (NSString *)getVersion;
+ (ALTracker *)sharedSingletonClass;

- (void)initialize:(NSString *)ratApiKey;

// report customTag
- (void)reportViewTag:(NSDictionary *)vdic;
- (void)reportCartTag:(NSDictionary *)vdic;
- (void)reportBuyTag:(NSDictionary *)vdic;

- (void)reportCustomTag:(NSString *)tagName value:(NSDictionary *)vdic;
- (void)reportCustomTagExtra:(NSString *)tagName value:(NSDictionary *)vdic extra:(NSString *)vexra;

// hybrid web
- (BOOL)parseWebViewRequest:(UIWebView*)wv with:(NSURLRequest *)request;
- (void)criteo_event:(NSArray*)events;

@end
