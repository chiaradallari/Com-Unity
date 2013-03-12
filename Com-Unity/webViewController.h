//
//  webViewController.h
//  Com-Unity
//
//  Created by Stardust on 04/02/13.
//  Copyright (c) 2013 Viviana Liuni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewController : UIViewController<UIWebViewDelegate>
{
    IBOutlet UIWebView *webView;
    IBOutlet UIProgressView *progresso;
	NSString *indirizzo;
    NSTimer *timer;
	double mynumber;
}

@property (nonatomic, retain) NSString *indirizzo;
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property(nonatomic,retain)UIProgressView *progresso;
@property(nonatomic,readwrite)double mynumber;

-(void)configureView;

@end
