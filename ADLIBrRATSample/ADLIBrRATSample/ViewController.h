//
//  ViewController.h
//  ADLIBrRATSample
//
//  Created by YongSun Kim on 2014. 8. 6..
//  Copyright (c) 2014년 mocoplex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController  <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webview;

- (void)loadDetail:(NSString *) data;

@end
