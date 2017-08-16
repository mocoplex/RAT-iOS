//
//  Tracker.h
//  ADLIBrRAT
//
//  Created by mocoplex on 2014. 7. 16..
//  Copyright (c) 2014 mocoplex. All rights reserved.
//
//  Tracker version 2.0.0 (b.003)
//  Build time pm 16:00 16.05.2017


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ALPicky.h"
#import "ALMyShop.h"


//RAT 수집 태그 종류
typedef NS_ENUM(NSInteger, ALRAT_TAG){
    
    ALRAT_TAG_VIEW = 0, //상품 보기
    ALRAT_TAG_BUY,      //상품 구매
    ALRAT_TAG_CART,     //상품 장바구니 이동
};


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

// report extra
- (void)reportCustomTag:(NSString *)tagName value:(NSDictionary *)vdic;
- (void)reportCustomTagExtra:(NSString *)tagName value:(NSDictionary *)vdic extra:(NSString *)vexra;

// hybrid web
- (BOOL)parseWebViewRequest:(UIWebView*)wv with:(NSURLRequest *)request;
- (void)criteo_event:(NSArray*)events;


// MyShop 상품 수집 API
- (void)reportMyShopProduct:(ALMyShopProduct *)product withTag:(ALRAT_TAG)tag;

- (void)reportMyShopSearchQuery:(NSString *)keyword;

@end
