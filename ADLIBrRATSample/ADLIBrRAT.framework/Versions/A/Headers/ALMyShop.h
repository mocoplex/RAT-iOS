//
//  ALMyShop.h
//  ADLIBrRAT
//
//  Created by gskang on 2017. 5. 16..
//  Copyright © 2017년 YongSun Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ALMyShopError){
    kALMyShopErrorEmptyResults = 0,  // 추천데이터가 없음
    kALMyShopErrorInvalidKey,        // RAT Key 입력 오류
    kALMyShopErrorInvalidResponse,   // 서버 응답 코드 오류
    kALMyShopErrorNetwork,           // 네트워크 요청 에러
};


@class ALMyShop;

//상품 추천 요청에 대한 델리게이트
@protocol ALMyShopProductDelegate <NSObject>

- (void)myshop:(ALMyShop *)picky didReceivedProductList:(NSArray *)productList;
- (void)myshop:(ALMyShop *)picky didReceivedProductListError:(NSError *)error withCode:(ALMyShopError)code;

@end

//키워드 추천 요청에 대한 델리게이트
@protocol ALMyshopKeywordDelegate <NSObject>

- (void)myshop:(ALMyShop *)picky didReceivedKeywordList:(NSArray *)keywordList;
- (void)myshop:(ALMyShop *)picky didReceivedKeywordListError:(NSError *)error withCode:(ALMyShopError)code;

@end




@interface ALMyShop : NSObject {
    
}

- (instancetype)init;

// cid : 발급한 마이샵 채널아이디
- (instancetype)initWithChannelId:(NSString *)cid;

// 추천데이터 요청 타입아웃을 지정하여 생성 (기본값 1초)
- (instancetype)initWithRequestTimeout:(NSTimeInterval)timeout;

// 추천데이터 요청 타입아웃을 지정하여 생성 (기본값 1초)
- (instancetype)initWithChannelId:(NSString *)cid
                   requestTimeout:(NSTimeInterval)timeout;


//상품 추천 함수

/**
 *  Best 추천 : 베스트 상품 추천
 *
 *  @param maxcount 최대 추천 상품 개수
 *  @param delegate 응답 delegate
 */
- (void)requestBestProductListWithMaximumCount:(NSUInteger)maxcount
                                      delegate:(id<ALMyShopProductDelegate>)delegate;


/**
 *  PbyP 추천 : 해당 상품을 본 사람들이 많이 본 상품 추천
 *
 *  @param numberString 상품번호 문자열
 *  @param maxcount 최대 추천 상품 개수
 *  @param delegate 응답 delegate
 */
- (void)requestPbyPListForProductNo:(NSString *)numberString
                       maximumCount:(NSUInteger)maxcount
                           delegate:(id<ALMyShopProductDelegate>)delegate;


/**
 *  PbyC 추천 : 해당 사용자가 볼것으로 기대되는 상품 추천
 *
 *  @param maxcount 최대 추천 상품 개수
 *  @param delegate 응답 delegate
 */
- (void)requestPbyCListWithMaximumCount:(NSUInteger)maxcount
                               delegate:(id<ALMyShopProductDelegate>)delegate;


/**
 *  PbyK 추천 : 해당 키워드와 관련있는 상품 추천
 *
 *  @param keyword 검색 키워드
 *  @param maxcount 최대 추천 상품 개수
 *  @param delegate 응답 delegate
 */
- (void)requestPbyKListWithKeyword:(NSString *)keyword
                      maximumCount:(NSUInteger)maxcount
                          delegate:(id<ALMyShopProductDelegate>)delegate;


//키워드 추천 함수

/**
 *  KbyP 추천 : 해당 상품과 관련있는 키워드 추천
 *
 *  @param numberString 상품 번호 문자열
 *  @param maxcount 최대 추천 상품 개수
 *  @param delegate 응답 delegate
 */
- (void)requestKbyPListWithProductNo:(NSString *)numberString
                        maximumCount:(NSUInteger)maxcount
                            delegate:(id<ALMyshopKeywordDelegate>)delegate;


/**
 *  KbyK 추천 : 해당 키워드와 관련있는 키워드 추천
 *
 *  @param keyword 검색 키워드
 *  @param maxcount 최대 추천 상품 개수
 *  @param delegate 응답 delegate
 */
- (void)requestKbyKListWithKeyword:(NSString *)keyword
                      maximumCount:(NSUInteger)maxcount
                          delegate:(id<ALMyshopKeywordDelegate>)delegate;


/**
 *  PopK 추천 : 최근 인기 검색어
 *
 *  @param maxcount 최대 추천 상품 개수
 *  @param delegate 응답 delegate
 */
- (void)requestPopKListWithMaximumCount:(NSUInteger)maxcount
                               delegate:(id<ALMyshopKeywordDelegate>)delegate;

@end



//마이샵 상품 수집을 위해 필요한 데이터
@interface ALMyShopProduct : NSObject  {
    
}

@property (nonatomic, copy) NSString *number;         //상품 번호
@property (nonatomic, copy) NSString *name;           //상품 이름
@property (nonatomic, copy) NSString *price;          //상품 현재 판매가격 (숫자만 포함하는 문자열, 할인 상품인 경우엔 할인가.)
@property (nonatomic, copy) NSString *regularPrice;   //상품의 정가 (숫자만 포함하는 문자열)
@property (nonatomic, copy) NSString *thubmUrl;       //상품 이미지 주소 (http://...)

@property (nonatomic, copy) NSString *category1;      //케테고리 대 분류
@property (nonatomic, copy) NSString *category2;      //케테고리 중 분류
@property (nonatomic, copy) NSString *category3;      //케테고리 소 분류

//VIEW TAG 전용
@property (nonatomic) NSString *inflowChannelId;      //추천을 통한 상세페이지 전환시 유입 채널 값
                                                      //추천상품에서 상세 View 발생시 채널아이디 문자열입력
                                                      //해당 내용이 아닌 View 발생시 @"N"을 명시적으로 지정가능

@property (nonatomic, copy) NSString *hashTag;        //상품에 관한 해시 태그들 문자열로 입력

//BUY TAG 전용
@property (nonatomic) NSInteger qty;                  //구매 수량


//부가정보 세팅하지 않을 경우 수집항목에서 제외됨.
@property (nonatomic) BOOL isSoldOut;                 //품절 여부 (품절 시 YES 지정)


- (NSDictionary *)dictionaryData;

@end
