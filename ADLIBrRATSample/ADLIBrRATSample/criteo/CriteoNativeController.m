//
//  ViewController.m
//  ADLIBrRATSample
//
//  Created by YongSun Kim on 2014. 8. 6..
//  Copyright (c) 2014년 mocoplex. All rights reserved.
//

#import "CriteoNativeController.h"
#import <ADLIBrRAT/ALTracker.h>

@interface CriteoNativeController ()

@end

@implementation CriteoNativeController

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
    NSMutableArray* list = [NSMutableArray array];
    
    NSString* eventName = @"viewProduct";
    
    NSMutableDictionary* obj = [NSMutableDictionary dictionary];
    [obj setObject:eventName forKey:@"event"];
    [obj setObject:@"상품번호" forKey:@"product"];
    [list addObject:obj];
    
    [[ALTracker sharedSingletonClass] criteo_event:list];
}

- (IBAction)clk_cart:(id)sender
{
    NSMutableArray* list = [NSMutableArray array];
    
    NSString* eventName = @"viewBasket";
    
    NSMutableDictionary* obj = [NSMutableDictionary dictionary];
    [obj setObject:eventName forKey:@"event"];
    
        NSMutableArray* prodlist = [NSMutableArray array];
    
    {
        NSMutableDictionary* prod = [NSMutableDictionary dictionary];
        [prod setObject:@"상품번호1" forKey:@"id"];
        [prod setObject:[NSNumber numberWithInt:1300] forKey:@"price"];
        [prod setObject:[NSNumber numberWithInt:3] forKey:@"quantity"];
        
        [prodlist addObject:prod];
    }
    {
        NSMutableDictionary* prod = [NSMutableDictionary dictionary];
        [prod setObject:@"상품번호2" forKey:@"id"];
        [prod setObject:[NSNumber numberWithInt:2300] forKey:@"price"];
        [prod setObject:[NSNumber numberWithInt:4] forKey:@"quantity"];
        
        [prodlist addObject:prod];
    }
    
    [obj setObject:prodlist forKey:@"product"];
    [list addObject:obj];

    [[ALTracker sharedSingletonClass] criteo_event:list];
}

- (IBAction)clk_buy:(id)sender
{
    NSMutableArray* list = [NSMutableArray array];
    
    NSString* eventName = @"trackTransaction";
    
    NSMutableDictionary* obj = [NSMutableDictionary dictionary];
    [obj setObject:eventName forKey:@"event"];
    [obj setObject:@"transactionID" forKey:@"id"];

    NSMutableArray* prodlist = [NSMutableArray array];
    
    {
        NSMutableDictionary* prod = [NSMutableDictionary dictionary];
        [prod setObject:@"상품번호1" forKey:@"id"];
        [prod setObject:[NSNumber numberWithInt:1300] forKey:@"price"];
        [prod setObject:[NSNumber numberWithInt:3] forKey:@"quantity"];
        
        [prodlist addObject:prod];
    }
    {
        NSMutableDictionary* prod = [NSMutableDictionary dictionary];
        [prod setObject:@"상품번호2" forKey:@"id"];
        [prod setObject:[NSNumber numberWithInt:2300] forKey:@"price"];
        [prod setObject:[NSNumber numberWithInt:4] forKey:@"quantity"];
        
        [prodlist addObject:prod];
    }
    
    [obj setObject:prodlist forKey:@"product"];
    [list addObject:obj];
    
    [[ALTracker sharedSingletonClass] criteo_event:list];
}

- (IBAction)clk_home:(id)sender
{
    NSMutableArray* list = [NSMutableArray array];
    
    NSString* eventName = @"viewHome";

    NSMutableDictionary* obj = [NSMutableDictionary dictionary];
    [obj setObject:eventName forKey:@"event"];
    [list addObject:obj];
    
    [[ALTracker sharedSingletonClass] criteo_event:list];
}

- (IBAction)clk_listing:(id)sender
{
    NSMutableArray* list = [NSMutableArray array];
    
    NSString* eventName = @"viewListing";
    
    NSMutableDictionary* obj = [NSMutableDictionary dictionary];
    [obj setObject:eventName forKey:@"event"];
    
        NSMutableArray* prodlist = [NSMutableArray array];
        [prodlist addObject:@"상품번호1"];
        [prodlist addObject:@"상품번호2"];

    [obj setObject:prodlist forKey:@"product"];

    [list addObject:obj];
    
    [[ALTracker sharedSingletonClass] criteo_event:list];
}


@end
