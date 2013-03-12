//
//  infoViewController.m
//  Com-Unity
//
//  Created by Stardust on 04/02/13.
//  Copyright (c) 2013 Viviana Liuni. All rights reserved.
//

#import "infoViewController.h"

@interface infoViewController ()

@end

@implementation infoViewController



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
    UIViewController *page1 = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoPage1"];
    UIViewController *page2 = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoPage2"];
    UIViewController *page3 = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoPage3"];
    UIViewController *page4 = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoPage4"];
    pages = [[NSArray alloc] initWithObjects:page1,page2,page3,page4, nil ];
    
    UIPageViewController *pvc = [[[UIPageViewController alloc]
                                 //initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                 //
                                 initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                 navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                 options:nil]autorelease];
    // pvc.delegate = self;
    
    NSArray *viewControllers = @[page1];
    [pvc setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    pvc.dataSource = self;
    self.dataSource = self;
    
    [self addChildViewController:pvc];
    [self.view addSubview: pvc.view];
    
    // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
    CGRect pageViewRect = self.view.bounds;
    pvc.view.frame = pageViewRect;
    
    [pvc didMoveToParentViewController:self];
    
    // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    self.view.gestureRecognizers = pvc.gestureRecognizers;
	// Do any additional setup after loading the view.
}



- (NSUInteger)indexOfViewController:(UIViewController *)viewController
{
    return [pages indexOfObject:viewController];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    int current = [self indexOfViewController:viewController];
    if(current <= 0)
        return nil;
    return [pages objectAtIndex:current - 1];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    int current = [self indexOfViewController:viewController];
    if(current >= pages.count - 1)
        return nil;
    return [pages objectAtIndex:current + 1];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    
    return pages.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    int current = [self indexOfViewController:pageViewController];
    return current;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [pages release];
    [super dealloc];
}

@end
