//
//  ALPicky.h
//  ADLIBrRAT
//
//  Created by mocoplex on 2016. 2. 3..
//  Copyright © 2016년 YongSun Kim. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, ALPickyError){
    
    kALPickyErrorInvalidKey = 0,
};

typedef NS_ENUM(NSInteger, ALPickyTag){

    kALPickyTagView = 0,
    kALPickyTagBuy,
};

@class ALPicky;

@protocol ALPickyDelegate <NSObject>

- (void)picky:(ALPicky *)picky didReceivedDataDictionary:(NSDictionary *)jsonData;
- (void)picky:(ALPicky *)picky didReceivedError:(NSError *)error;

@end


@interface ALPicky : NSObject {
    
}

- (instancetype)init;
- (instancetype)initWithRequestTimeout:(NSTimeInterval)timeout;

/* may be nil if no response has been received */
@property (nonatomic, strong, readonly) NSURLSessionDataTask *dataTask;

@property (nonatomic) NSUInteger maximumItemCount; //default : 5

/**
 *  상품 번호에 대한 추천 상품리스트를 요청
 *
 *  @param numberString 상품번호 문자열
 *  @param tagType 피키 태그 타입
 *  @param delegate 응답 delegate
 */
- (void)requestItemListForProductNo:(NSString *)numberString
                           pickyTag:(ALPickyTag)tagType
                           delegate:(id<ALPickyDelegate>)delegate;

/**
 *  개인화 추천 상품 리스트를 요청
 *
 *  @param tagType 피키 태그 타입
 *  @param delegate 응답 delegate
 */
- (void)requestItemListForPickyTag:(ALPickyTag)tagType
                          delegate:(id<ALPickyDelegate>)delegate;

/**
 *  현재 요청을 중지
 */
- (void)cancelRequest;

@end
