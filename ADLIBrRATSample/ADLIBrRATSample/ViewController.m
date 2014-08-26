//
//  ViewController.m
//  ADLIBrRATSample
//
//  Created by YongSun Kim on 2014. 8. 6..
//  Copyright (c) 2014년 mocoplex. All rights reserved.
//

#import "ViewController.h"
#import <ADLIBrRAT/Tracker.h>
#import <iAd/iAd.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.webview.delegate = self;
    
    NSString *fullURL = @"http://demo.mocoplex.com/rat/index.html";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webview loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark
#pragma WebView Delegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"ERROR");
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *requestStr = [[request URL] absoluteString];
    NSString *scheme = [[request URL] scheme];
    
    //NSLog(@"url : %@", requestStr);
    //NSLog(@"scheme : %@", scheme);
    
    if([scheme isEqualToString:@"ios"]){
        
        NSArray *listItems = [requestStr componentsSeparatedByString:@":"];
        NSString *value = [listItems lastObject];
        
        if([requestStr rangeOfString:@"VIEW"].location != NSNotFound){ // View Sample Code
            
            // Optional : tag tracking
            [[Tracker sharedSingletonClass] view:[NSDictionary dictionaryWithObjectsAndKeys:value, @"pid", nil]];
            
            NSString *detailURL = @"http://demo.mocoplex.com/rat/detail.html?item=";

            detailURL = [detailURL stringByAppendingString:value];

            NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL URLWithString:detailURL]];
            [_webview loadRequest:requestObj];
            
        }else if([requestStr rangeOfString:@"CART"].location != NSNotFound){ // Cart Sample Code
            
            // Optional : tag tracking
            [[Tracker sharedSingletonClass] cart:[NSDictionary dictionaryWithObjectsAndKeys:value, @"pid", nil]];
            
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Item added to Cart."
                                delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            
        }else if([requestStr rangeOfString:@"BUY"].location != NSNotFound){ // Buy Sample Code
            
            // Optional : tag tracking
            [[Tracker sharedSingletonClass] buy:[NSDictionary dictionaryWithObjectsAndKeys:value, @"pid", nil]];
            
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Thank you."
                                delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }else if([requestStr rangeOfString:@"CUSTOM"].location != NSNotFound){ // Custom tag Sample Code
            [[Tracker sharedSingletonClass] customTag:@"CLICK"
                        value:[NSDictionary dictionaryWithObjectsAndKeys:value, @"pid",
                                                                        @"cloth", @"category",
                                                                        @"100000", @"price",
                                                                        @"10", @"qty",
                                                                        nil]];
        }
        return NO;
    }

    return YES;
}

- (void)showDetail:(NSString *) data
{
    // Optional : tag tracking
    [[Tracker sharedSingletonClass] view:[NSDictionary dictionaryWithObjectsAndKeys:data, @"pid", nil]];
    
    NSString *fullURL = [NSString stringWithFormat:@"http://demo.mocoplex.com/rat/detail.html?item=%@", data];
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webview loadRequest:requestObj];
}


@end
