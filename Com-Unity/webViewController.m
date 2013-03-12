//
//  webViewController.m
//  Com-Unity
//
//  Created by Stardust on 04/02/13.
//  Copyright (c) 2013 Viviana Liuni. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()

@end

@implementation webViewController

@synthesize indirizzo,webView,mynumber,progresso;



-(void)loadTimer
{
	if (!webView.loading) {
		mynumber = 0;
		progresso.progress = mynumber;
		
	}
	else {
		mynumber = mynumber + 0.1;
		progresso.progress = mynumber;
		
	}
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureView];
    
}



-(void)viewWillAppear:(BOOL)animated
{
    [self configureView];
    [super viewWillAppear:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)configureView
{
    // Update the user interface for the detail item.
    mynumber = 0;
    indirizzo=@"http://www.com-unity.it";
        NSURL *url = [NSURL URLWithString:indirizzo];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        // visualizza la pagina nella UIWebView
        [webView loadRequest:requestObj];
        [webView setScalesPageToFit:YES];
        timer =  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(loadTimer) userInfo:nil repeats:YES];
    
    
}



#pragma mark - Split view


-(void)dealloc
{
    [progresso release];
    [indirizzo release];
    [webView release];
    [super dealloc];
}
@end
