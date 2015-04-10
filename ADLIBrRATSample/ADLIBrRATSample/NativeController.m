//
//  ViewController.m
//  ADLIBrRATSample
//
//  Created by YongSun Kim on 2014. 8. 6..
//  Copyright (c) 2014년 mocoplex. All rights reserved.
//

#import "NativeController.h"
#import <ADLIBrRAT/Tracker.h>
#import <iAd/iAd.h>
#import <AdSupport/ASIdentifierManager.h>

#import <ADLIBrRAT/Tracker.h>

@interface NativeController ()

@end

@implementation NativeController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clk_view:(id)sender
{
    NSMutableDictionary *obj = [NSMutableDictionary dictionary];
    [obj setValue:@"상품 번호 입력" forKey:@"p_no"];
    [obj setValue:@"상품 이름 입력" forKey:@"name"];
    [obj setValue:@"상품 수량" forKey:@"qty"];
    [obj setValue:@"12300(상품가격 숫자만)" forKey:@"price"];
    [obj setValue:@"http://상품이미지주소" forKey:@"thumb"];
    [obj setValue:@"로그인 한 경우 사용자의 아이디 또는 이메일주소, 로그인하지 않은 경우 공백" forKey:@"account"];
    [obj setValue:@"카테고리 정보 1, 대분류" forKey:@"cate1"];
    [obj setValue:@"카테고리 정보 2, 중분류" forKey:@"cate2"];
    [obj setValue:@"카테고리 정보 3, 소분류" forKey:@"cate3"];
    
    [obj setValue:@"mobile" forKey:@"platform"];
    
    NSString* tagname = @"VIEW";
    
    [[Tracker sharedSingletonClass] customTag:tagname value:obj];
}

- (IBAction)clk_cart:(id)sender
{
    // 상품이 여러개인경우 반복해서 호출합니다.
    {
        NSMutableDictionary *obj = [NSMutableDictionary dictionary];
        [obj setValue:@"상품 번호1" forKey:@"p_no"];
        [obj setValue:@"상품 이름 입력" forKey:@"name"];
        [obj setValue:@"상품 수량" forKey:@"qty"];
        [obj setValue:@"12300(상품가격 숫자만)" forKey:@"price"];
        [obj setValue:@"http://상품이미지주소" forKey:@"thumb"];
        [obj setValue:@"로그인 한 경우 사용자의 아이디 또는 이메일주소, 로그인하지 않은 경우 공백" forKey:@"account"];
        [obj setValue:@"카테고리 정보 1, 대분류" forKey:@"cate1"];
        [obj setValue:@"카테고리 정보 2, 중분류" forKey:@"cate2"];
        [obj setValue:@"카테고리 정보 3, 소분류" forKey:@"cate3"];
        
        [obj setValue:@"mobile" forKey:@"platform"];
        
        NSString* tagname = @"CART";

        [[Tracker sharedSingletonClass] customTag:tagname value:obj];
    }
    {
        NSMutableDictionary *obj = [NSMutableDictionary dictionary];
        [obj setValue:@"상품 번호2" forKey:@"p_no"];
        [obj setValue:@"상품 이름 입력" forKey:@"name"];
        [obj setValue:@"상품 수량" forKey:@"qty"];
        [obj setValue:@"12300(상품가격 숫자만)" forKey:@"price"];
        [obj setValue:@"http://상품이미지주소" forKey:@"thumb"];
        [obj setValue:@"로그인 한 경우 사용자의 아이디 또는 이메일주소, 로그인하지 않은 경우 공백" forKey:@"account"];
        [obj setValue:@"카테고리 정보 1, 대분류" forKey:@"cate1"];
        [obj setValue:@"카테고리 정보 2, 중분류" forKey:@"cate2"];
        [obj setValue:@"카테고리 정보 3, 소분류" forKey:@"cate3"];
        
        [obj setValue:@"mobile" forKey:@"platform"];
        
        NSString* tagname = @"CART";
        
        [[Tracker sharedSingletonClass] customTag:tagname value:obj];
    }
}
- (IBAction)clk_buy:(id)sender
{
    // 상품이 여러개인경우 반복해서 호출합니다.
    {
        NSMutableDictionary *obj = [NSMutableDictionary dictionary];
        [obj setValue:@"상품 번호1" forKey:@"p_no"];
        [obj setValue:@"상품 이름 입력" forKey:@"name"];
        [obj setValue:@"상품 수량" forKey:@"qty"];
        [obj setValue:@"12300(상품가격 숫자만)" forKey:@"price"];
        [obj setValue:@"http://상품이미지주소" forKey:@"thumb"];
        [obj setValue:@"로그인 한 경우 사용자의 아이디 또는 이메일주소, 로그인하지 않은 경우 공백" forKey:@"account"];
        [obj setValue:@"카테고리 정보 1, 대분류" forKey:@"cate1"];
        [obj setValue:@"카테고리 정보 2, 중분류" forKey:@"cate2"];
        [obj setValue:@"카테고리 정보 3, 소분류" forKey:@"cate3"];
        
        [obj setValue:@"mobile" forKey:@"platform"];
        
        NSString* tagname = @"BUY";
        
        [[Tracker sharedSingletonClass] customTag:tagname value:obj];
    }
    {
        NSMutableDictionary *obj = [NSMutableDictionary dictionary];
        [obj setValue:@"상품 번호2" forKey:@"p_no"];
        [obj setValue:@"상품 이름 입력" forKey:@"name"];
        [obj setValue:@"상품 수량" forKey:@"qty"];
        [obj setValue:@"12300(상품가격 숫자만)" forKey:@"price"];
        [obj setValue:@"http://상품이미지주소" forKey:@"thumb"];
        [obj setValue:@"로그인 한 경우 사용자의 아이디 또는 이메일주소, 로그인하지 않은 경우 공백" forKey:@"account"];
        [obj setValue:@"카테고리 정보 1, 대분류" forKey:@"cate1"];
        [obj setValue:@"카테고리 정보 2, 중분류" forKey:@"cate2"];
        [obj setValue:@"카테고리 정보 3, 소분류" forKey:@"cate3"];
        
        [obj setValue:@"mobile" forKey:@"platform"];
        
        NSString* tagname = @"BUY";
        
        [[Tracker sharedSingletonClass] customTag:tagname value:obj];
    }
}


@end
