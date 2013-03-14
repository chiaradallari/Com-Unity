//
//  videoViewController.m
//  Com-Unity
//
//  Created by Stardust on 14/03/13.
//  Copyright (c) 2013 Viviana Liuni. All rights reserved.
//

#import "videoViewController.h"

@interface videoViewController ()

@end

@implementation videoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)moviePlayBackDidFinish:(NSNotification*)aNotification{
    NSLog(@"Play Back Finished!");
    [myPlayer play];
}

- (void)viewDidLoad
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"VideoComUnity" ofType:@"mp4"];
    
    myPlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:path]];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:myPlayer];
    CGRect frame;
	frame.size.width=320;
    frame.size.height=192;
	frame.origin.x=0;
    frame.origin.y=165;
    
    myPlayer.scalingMode=MPMovieScalingModeAspectFit;
    [myPlayer.view setFrame:frame];
    myPlayer.shouldAutoplay = YES;
    [self.view addSubview:myPlayer.view];
    [myPlayer setFullscreen:YES animated:YES];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [myPlayer release];
    [super dealloc];
}

@end
