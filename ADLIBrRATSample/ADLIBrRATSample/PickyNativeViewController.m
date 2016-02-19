//
//  PickyNativeViewController.m
//  ADLIBrRATSample
//
//  Created by gskang on 2016. 2. 3..
//  Copyright © 2016년 mocoplex. All rights reserved.
//

#import "PickyNativeViewController.h"
#import <ADLIBrRAT/ALPicky.h>

#define kPickyChannelId @"INSERT_YOUR_CHANNEL_ID"

@interface PickyNativeViewController () <ALPickyDelegate>

@property (nonatomic, strong) ALPicky *picky;

@end


@implementation PickyNativeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self cancelRequest];
}

- (IBAction)buttonAction:(id)sender
{
    [self requestItems];
}

- (void)requestItems
{
    [self cancelRequest];
    
    self.textView.text = @"...";
    
    NSInteger rType = 0;
    
    switch (rType) {
        case 0 :
        {
            ALPicky *picky = [[ALPicky alloc] initWithChannelId:kPickyChannelId];
            self.picky = picky;
            [picky requestItemListForProductNo:@"145527" //product number
                                      pickyTag:kALPickyTagView
                                      delegate:self];
            break;
        }
            
        case 1:
        {
            ALPicky *picky = [[ALPicky alloc] initWithChannelId:kPickyChannelId
                                              andRequestTimeout:1.0];
            self.picky = picky;
            picky.maximumItemCount = 10;
            
            [picky requestItemListForProductNo:@"145527"
                                      pickyTag:kALPickyTagBuy
                                      delegate:self];
            break;
        }
            
        case 2:
        {
            ALPicky *picky = [[ALPicky alloc] initWithChannelId:kPickyChannelId];
            self.picky = picky;
            [picky requestItemListForPickyTag:kALPickyTagView delegate:self];
            break;
        }
            
        case 3:
        default:
        {
            ALPicky *picky = [[ALPicky alloc] initWithChannelId:kPickyChannelId
                                              andRequestTimeout:3.0];
            self.picky = picky;
            picky.maximumItemCount = 3;
            [picky requestItemListForPickyTag:kALPickyTagBuy delegate:self];
            break;
        }
    }
}

- (void)cancelRequest
{
    [self.picky cancelRequest];
}

#pragma mark -

- (void)picky:(ALPicky *)picky didReceivedError:(NSError *)error
{
    NSString *log = [NSString stringWithFormat:@"picky didReceivedError\n\n%@", error];
    self.textView.text = log;
    
    NSLog(@"%@", log);
}

- (void)picky:(ALPicky *)picky didReceivedDataDictionary:(NSDictionary *)jsonData
{
    NSString *log = [NSString stringWithFormat:@"picky didReceivedDataDictionary\n\n%@", jsonData];
    self.textView.text = log;
    [self test_showRecommendProduct];
}

- (void)test_showRecommendProduct
{
    if (self.picky) {
        NSUInteger numberOfItem = [self.picky numberOfRecommendedProducts];
        if (numberOfItem > 0) {
            
            //Reported Impression Event callback
            ALPickyProduct *item = [self.picky displayProductAtIndex:0];
            NSString *pName = item.product_name;
            self.nativeNameLabel.text = pName;
            UIImage *thumb = nil; //downloaded image from "item.thumbUrlStr"
            self.nativeThumbView.image = thumb;
        }
    }
}

- (IBAction)test_reportProductClick
{
    //Reported Click Event callback
    ALPickyProduct *item = [self.picky clickProductAtIndex:0];
    
    if (item) {
        NSString *pno = item.product_number;
        NSString *pname = item.product_name;
        NSLog(@"click item = [%@] : %@" ,pno, pname);
        
        //create and show detailViewConroller with selected ProductNumber
        //
        // ...
    }
}

@end
