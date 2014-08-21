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
    
    NSLog(@"url : %@", requestStr);
    NSLog(@"scheme : %@", scheme);
    
    if([scheme isEqualToString:@"ios"]){
        
        NSArray *listItems = [requestStr componentsSeparatedByString:@":"];
        NSString *lastObj = [listItems lastObject];
        
        if([requestStr rangeOfString:@"VIEW"].location != NSNotFound){
            [[Tracker sharedSingletonClass] view:[NSDictionary dictionaryWithObject:lastObj forKey:@"pid"]];
            
            NSString *detailURL = @"http://demo.mocoplex.com/rat/detail.html?item=";

            detailURL = [detailURL stringByAppendingString:lastObj];
            NSLog(@"fullURL : %@", detailURL);
            NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL URLWithString:detailURL]];
            [_webview loadRequest:requestObj];
            
        }else if([requestStr rangeOfString:@"CART"].location != NSNotFound){
            [[Tracker sharedSingletonClass] cart:[NSDictionary dictionaryWithObject:lastObj forKey:@"pid"]];
            
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Item added to Cart." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            
        }else if([requestStr rangeOfString:@"BUY"].location != NSNotFound){
            [[Tracker sharedSingletonClass] buy:[NSDictionary dictionaryWithObject:lastObj forKey:@"pid"]];
            
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Thank you." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }
        return NO;
    }

    return YES;
}

- (void)loadDetail:(NSString *) data
{
    NSString *fullURL = [NSString stringWithFormat:@"http://demo.mocoplex.com/rat/detail.html?item=%@", data];
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webview loadRequest:requestObj];
}


@end
