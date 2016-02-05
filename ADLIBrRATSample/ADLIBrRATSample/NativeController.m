//
//  ViewController.m
//  ADLIBrRATSample
//
//  Created by YongSun Kim on 2014. 8. 6..
//  Copyright (c) 2014년 mocoplex. All rights reserved.
//

#import "NativeController.h"
#import <ADLIBrRAT/ALTracker.h>

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
    
    [obj setValue:@"12300" forKey:@"price"];    //상품 가격 : 숫자만 포함하는 문자열로 전달
    [obj setValue:@"10000" forKey:@"discount"]; //할인된 가격 : 숫자만 포함하는 문자열로 전달
    
    [obj setValue:@"http://상품이미지주소" forKey:@"thumb"];
    [obj setValue:@"로그인 한 경우 사용자의 아이디 또는 이메일주소, 로그인하지 않은 경우 공백" forKey:@"account"];
    [obj setValue:@"카테고리 정보 1, 대분류" forKey:@"cate1"];
    [obj setValue:@"카테고리 정보 2, 중분류" forKey:@"cate2"];
    [obj setValue:@"카테고리 정보 3, 소분류" forKey:@"cate3"];
    
    [obj setValue:@"mobile" forKey:@"platform"];
    
    [[ALTracker sharedSingletonClass] reportViewTag:obj];
}

- (IBAction)clk_cart:(id)sender
{
    // 상품이 여러개인경우 반복해서 호출합니다.
    {
        NSMutableDictionary *obj = [NSMutableDictionary dictionary];
        [obj setValue:@"상품 번호1" forKey:@"p_no"];
        [obj setValue:@"상품 이름 입력" forKey:@"name"];
        [obj setValue:@"상품 수량" forKey:@"qty"];
        
        [obj setValue:@"12300" forKey:@"price"];    //상품 가격 : 숫자만 포함하는 문자열로 전달
        [obj setValue:@"10000" forKey:@"discount"]; //할인된 가격 : 숫자만 포함하는 문자열로 전달
        
        [obj setValue:@"http://상품이미지주소" forKey:@"thumb"];
        [obj setValue:@"로그인 한 경우 사용자의 아이디 또는 이메일주소, 로그인하지 않은 경우 공백" forKey:@"account"];
        [obj setValue:@"카테고리 정보 1, 대분류" forKey:@"cate1"];
        [obj setValue:@"카테고리 정보 2, 중분류" forKey:@"cate2"];
        [obj setValue:@"카테고리 정보 3, 소분류" forKey:@"cate3"];
        
        [obj setValue:@"mobile" forKey:@"platform"];
        
        [[ALTracker sharedSingletonClass] reportCartTag:obj];
    }
    {
        NSMutableDictionary *obj = [NSMutableDictionary dictionary];
        [obj setValue:@"상품 번호2" forKey:@"p_no"];
        [obj setValue:@"상품 이름 입력" forKey:@"name"];
        [obj setValue:@"상품 수량" forKey:@"qty"];
        
        [obj setValue:@"12300" forKey:@"price"];    //상품 가격 : 숫자만 포함하는 문자열로 전달
        [obj setValue:@"10000" forKey:@"discount"]; //할인된 가격 : 숫자만 포함하는 문자열로 전달
        
        [obj setValue:@"http://상품이미지주소" forKey:@"thumb"];
        [obj setValue:@"로그인 한 경우 사용자의 아이디 또는 이메일주소, 로그인하지 않은 경우 공백" forKey:@"account"];
        [obj setValue:@"카테고리 정보 1, 대분류" forKey:@"cate1"];
        [obj setValue:@"카테고리 정보 2, 중분류" forKey:@"cate2"];
        [obj setValue:@"카테고리 정보 3, 소분류" forKey:@"cate3"];
        
        [obj setValue:@"mobile" forKey:@"platform"];
        
        [[ALTracker sharedSingletonClass] reportCartTag:obj];
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
        
        [obj setValue:@"12300" forKey:@"price"];    //상품 가격 : 숫자만 포함하는 문자열로 전달
        [obj setValue:@"10000" forKey:@"discount"]; //할인된 가격 : 숫자만 포함하는 문자열로 전달
        
        [obj setValue:@"http://상품이미지주소" forKey:@"thumb"];
        [obj setValue:@"로그인 한 경우 사용자의 아이디 또는 이메일주소, 로그인하지 않은 경우 공백" forKey:@"account"];
        [obj setValue:@"카테고리 정보 1, 대분류" forKey:@"cate1"];
        [obj setValue:@"카테고리 정보 2, 중분류" forKey:@"cate2"];
        [obj setValue:@"카테고리 정보 3, 소분류" forKey:@"cate3"];
        
        [obj setValue:@"mobile" forKey:@"platform"];
        
        [[ALTracker sharedSingletonClass] reportBuyTag:obj];
    }
    {
        NSMutableDictionary *obj = [NSMutableDictionary dictionary];
        [obj setValue:@"상품 번호2" forKey:@"p_no"];
        [obj setValue:@"상품 이름 입력" forKey:@"name"];
        [obj setValue:@"상품 수량" forKey:@"qty"];
        
        [obj setValue:@"12300" forKey:@"price"];    //상품 가격 : 숫자만 포함하는 문자열로 전달
        [obj setValue:@"10000" forKey:@"discount"]; //할인된 가격 : 숫자만 포함하는 문자열로 전달
        
        [obj setValue:@"http://상품이미지주소" forKey:@"thumb"];
        [obj setValue:@"로그인 한 경우 사용자의 아이디 또는 이메일주소, 로그인하지 않은 경우 공백" forKey:@"account"];
        [obj setValue:@"카테고리 정보 1, 대분류" forKey:@"cate1"];
        [obj setValue:@"카테고리 정보 2, 중분류" forKey:@"cate2"];
        [obj setValue:@"카테고리 정보 3, 소분류" forKey:@"cate3"];
        
        [obj setValue:@"mobile" forKey:@"platform"];
        
        [[ALTracker sharedSingletonClass] reportBuyTag:obj];
    }
}

- (IBAction)clk_custom1:(id)sender
{
    {
        NSDate *date = [NSDate date];
        double ts = [date timeIntervalSince1970];
        NSNumber *tsn = [NSNumber numberWithDouble:ts];
        
        NSArray *list = @[@(1), @(2), @(3.1)];
        NSMutableDictionary *obj = [NSMutableDictionary dictionary];
        [obj setValue:@"12234" forKey:@"view_no"];
        [obj setValue:tsn forKey:@"timestamp"];
        [obj setValue:list forKey:@"list"];
        
        NSString* tagname = @"CT5";
        
        [[ALTracker sharedSingletonClass] reportCustomTag:tagname value:obj];
    }
}

@end
