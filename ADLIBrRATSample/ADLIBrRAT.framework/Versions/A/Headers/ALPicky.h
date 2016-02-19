//
//  ALPicky.h
//  ADLIBrRAT
//
//  Created by mocoplex on 2016. 2. 3..
//  Copyright © 2016 mocoplex. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, ALPickyError){
    
    kALPickyErrorInvalidKey = 0,        // RAT Key 입력 오류
    kALPickyErrorInvalidResponse = 1,   // 서버 응답 코드 오류
};

typedef NS_ENUM(NSInteger, ALPickyTag){

    kALPickyTagView = 0,
    kALPickyTagBuy,
};

/**
 *  Picky Inside 상품 데이터 클래스
 */
@interface ALPickyProduct : NSObject {
    
}

@property (nonatomic, copy, readonly) NSString *product_number; //상품 번호
@property (nonatomic, copy, readonly) NSString *product_name;   //상품 명
@property (nonatomic, copy, readonly) NSString *thumbUrlStr;    //상품 섬네일 주소

@property (nonatomic, copy, readonly) NSString *category_name1; //상품 카테고리 대분류 명
@property (nonatomic, copy, readonly) NSString *category_name2; //상품 카테고리 중분류 명
@property (nonatomic, copy, readonly) NSString *category_name3; //상품 카테고리 소분류 명

@property (nonatomic, copy, readonly) NSString *date;
@property (nonatomic, copy, readonly) NSString *shop_id;

@property (nonatomic, copy, readonly) NSString *price;
@property (nonatomic, copy, readonly) NSString *regular_price;
@property (nonatomic, copy, readonly) NSString *discount_price;

@end



@class ALPicky;

@protocol ALPickyDelegate <NSObject>

- (void)picky:(ALPicky *)picky didReceivedDataDictionary:(NSDictionary *)jsonData;
- (void)picky:(ALPicky *)picky didReceivedError:(NSError *)error;

@end


/**
 *  Picky Inside 네이티브 연동을 위한 클래스
 *
 *  기본적으로는 추천 상품을 요청하는 역활을 수행한다.
 *  개인화 추천과 상품에 대한 추천을 요청하는 2가지 메소드를 제공한다.
 *  
 */
@interface ALPicky : NSObject {
    
}

- (instancetype)initWithChannelId:(NSString *)cid;

- (instancetype)initWithChannelId:(NSString *)cid
                   andRequestTimeout:(NSTimeInterval)timeout;

/* may be nil if no response has been received */
@property (nonatomic, strong, readonly) NSURLSessionDataTask *dataTask;

@property (nonatomic) NSUInteger maximumItemCount; //default : 5

/**
 *  상품 번호에 대한 추천 상품리스트를 요청
 *
 *  @param numberString 상품번호 문자열
 *  @param tagType 피키 태그 타입
 *  @param delegate 응답 delegate
 *  @brief
 *   CASE1 : tag View - 주어진 상품을 본 사람들이 많이 본 상품을 추천
 *   CASE2 : tag Buy  - 주어진 상품을 구매한 사람들이 많이 구매한 상품을 추천
 */
- (void)requestItemListForProductNo:(NSString *)numberString
                           pickyTag:(ALPickyTag)tagType
                           delegate:(id<ALPickyDelegate>)delegate;

/**
 *  개인화 추천 상품 리스트를 요청
 *
 *  @param tagType 피키 태그 타입
 *  @param delegate 응답 delegate
 *  @brief
 *   CASE1 : tag View - 해당 사용자가 향후 볼 것이라 예상되는 상품을 추천
 *   CASE2 : tag Buy  - 해당 사용자가 향후 구매할 것이라 예상되는 상품을 추천
 */
- (void)requestItemListForPickyTag:(ALPickyTag)tagType
                          delegate:(id<ALPickyDelegate>)delegate;

/**
 *  현재 요청을 중지
 *
 *  @brief
 *      기존에 요청에 성공하여 유지하고 있던 추천 상품리스트는 초기화된다.
 */
- (void)cancelRequest;

/**
 *  응답 받은 jSON 데이터가 파싱된 추천 상품데이터 객체(ALPickyProduct)의 개수를 반환
 */
- (NSUInteger)numberOfRecommendedProducts;


/**
 *  추천 상품을 지면에 게시하기 위해 추천상품리스트에서 객체를 구하는 메소드
 *
 *  추천 받은 상품을 지면에 게시할때 해당 메소드를 통해 상품 객체를 구한다.
 *  이때, 내부적으로 1회 해당 지면에 대한 노출 리포트가 수행된다.
 *
 *  @param idx NSArray index
 */
- (ALPickyProduct *)displayProductAtIndex:(NSUInteger)idx;


/**
 *  화면에 표시한 추천 상품에 대한 클릭 이벤트가 발생할 경우 상세 화면 등의 전환이 필요한 경우 
 *  해당 메소드를 통해 추천 상품 데이터 객체에 접근한다.
 *
 *  해당 메소드를 통해 클릭이 발생하는 추천상품에 대한 정보를 가져와야 내부적으로
 *  클릭에대한 리포트가 수행된다.
 *
 *  @param idx NSArray index
 */
- (ALPickyProduct *)clickProductAtIndex:(NSUInteger)idx;

@end


