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
    if ([error code] != NSURLErrorCancelled) {
        NSLog(@"webview error : %d", [error code]);
    }
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    @try {
        NSString *requestStr = [[request URL] absoluteString];
        NSString *scheme = [[request URL] scheme];
        
        NSString *requestStrUTF8 = [requestStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        NSLog(@"reqeust->%@", requestStrUTF8);

        if([scheme isEqualToString:@"adlibtrk"]){

            if([requestStr hasPrefix:@"adlibtrk:VIEW:"]){
                
                NSString *requestData = [requestStr substringFromIndex:[requestStr rangeOfString:@"adlibtrk:VIEW:"].length];
                NSString *requestDataUTF8 = [requestData stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                
                NSData *data = [requestDataUTF8 dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                                         options:kNilOptions
                                                                           error:nil];
                // Optional : tag tracking (VIEW)
                [[Tracker sharedSingletonClass] view:jsonData];
            }else if([requestStr hasPrefix:@"adlibtrk:CART:"]){
                
                NSString *requestData = [requestStr substringFromIndex:[requestStr rangeOfString:@"adlibtrk:CART:"].length];
                NSString *requestDataUTF8 = [requestData stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                
                NSData *data = [requestDataUTF8 dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                                         options:kNilOptions
                                                                           error:nil];
                // Optional : tag tracking (CART)
                [[Tracker sharedSingletonClass] cart:jsonData];
            }else if([requestStr hasPrefix:@"adlibtrk:BUY:"]){
                
                NSString *requestData = [requestStr substringFromIndex:[requestStr rangeOfString:@"adlibtrk:BUY:"].length];
                NSString *requestDataUTF8 = [requestData stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

                NSData *data = [requestDataUTF8 dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                                         options:kNilOptions
                                                                           error:nil];
                // Optional : tag tracking (BUY)
                [[Tracker sharedSingletonClass] buy:jsonData];
            }else if([requestStr hasPrefix:@"adlibtrk:CUSTOM_TAG:"]){
                
                NSString *requestData = [requestStr substringFromIndex:[requestStr rangeOfString:@"adlibtrk:CUSTOM_TAG:"].length];
                NSString *requestDataUTF8 = [requestData stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                
                NSString *tagName = [requestDataUTF8 substringToIndex:[requestDataUTF8 rangeOfString:@"#####"].location];
                
                NSInteger idx = [requestDataUTF8 rangeOfString:@"#####"].location + [requestDataUTF8 rangeOfString:@"#####"].length;
                NSString *tagValue = [requestDataUTF8 substringFromIndex:idx];
                
                NSData *data = [tagValue dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                                         options:kNilOptions
                                                                           error:nil];
                
                // Optional : tag tracking (CUSTOM_TAG)
                [[Tracker sharedSingletonClass] customTag:tagName value:jsonData];
            }else if([requestStr rangeOfString:@"adlibtrk:MESSAGE:"].location != NSNotFound){ // alert message
                
                NSString *requestData = [requestStr substringFromIndex:[requestStr rangeOfString:@"adlibtrk:MESSAGE:"].length];
                NSString *requestDataUTF8 = [requestData stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:requestDataUTF8
                                                                delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            return NO;
        }
    }
    @catch (NSException *exception) {

        
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
