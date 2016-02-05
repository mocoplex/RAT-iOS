//
//  ViewController.m
//  ADLIBrRATSample
//
//  Created by YongSun Kim on 2014. 8. 6..
//  Copyright (c) 2014년 mocoplex. All rights reserved.
//

#import "HybridController.h"
#import <ADLIBrRAT/ALTracker.h>

@interface HybridController ()

@end

@implementation HybridController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.webview.delegate = self;
    
    NSString *fullURL = @"http://mkt.adlibr.com/rat_sample/hybrid/";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webview loadRequest:requestObj];
    
    NSLog(@"init");
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
    if ([error code] != NSURLErrorCancelled) {
        NSLog(@"webview error : %@", error);
    }
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if([[ALTracker sharedSingletonClass] parseWebViewRequest:webView with:request])
        return NO;

    return YES;
}


@end
