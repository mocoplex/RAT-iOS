//
//  PickyNativeViewController.m
//  ADLIBrRATSample
//
//  Created by gskang on 2016. 2. 3..
//  Copyright © 2016년 mocoplex. All rights reserved.
//

#import "PickyNativeViewController.h"
#import <ADLIBrRAT/ALPicky.h>

@interface PickyNativeViewController () <ALPickyDelegate>

@property (nonatomic, strong) ALPicky *picky;

@end


@implementation PickyNativeViewController

- (void)viewDidLoad {
  
    [super viewDidLoad];
    
    
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        [self setAutomaticallyAdjustsScrollViewInsets:NO];
    }
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
    
    NSInteger rType = 2;
    
    switch (rType) {
        case 0 :
        {
            ALPicky *picky = [[ALPicky alloc] init];
            self.picky = picky;
            [picky requestItemListForProductNo:@"0be226c2bfee28114a9cb2de6c97b19a"
                                     pickyTag:kALPickyTagView
                                      delegate:self]; 
            break;
        }

        case 1:
        {
            ALPicky *picky = [[ALPicky alloc] initWithRequestTimeout:1.0];
            self.picky = picky;
            picky.maximumItemCount = 10;
            
            [picky requestItemListForProductNo:@"0be226c2bfee28114a9cb2de6c97b19a"
                                      pickyTag:kALPickyTagBuy
                                      delegate:self];
            break;
        }

        case 2:
        {
            ALPicky *picky = [[ALPicky alloc] init];
            self.picky = picky;
            [picky requestItemListForPickyTag:kALPickyTagView delegate:self];
            break;
        }
            
        case 3:
        default:
        {
            ALPicky *picky = [[ALPicky alloc] initWithRequestTimeout:3.0];
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

- (void)picky:(ALPicky *)picky didReceivedDataDictionary:(NSDictionary *)jsonData
{
    NSString *log = [NSString stringWithFormat:@"picky didReceivedDataDictionary\n\n%@", jsonData];
    self.textView.text = log;
    NSLog(@"%@", log);
}

- (void)picky:(ALPicky *)picky didReceivedError:(NSError *)error
{
    NSString *log = [NSString stringWithFormat:@"picky didReceivedError\n\n%@", error];
    self.textView.text = log;
                     
    NSLog(@"%@", log);
}

@end
