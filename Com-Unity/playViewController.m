//
//  playViewController.m
//  Com-Unity
//
//  Created by Stardust on 05/02/13.
//  Copyright (c) 2013 Viviana Liuni. All rights reserved.
//

#import "playViewController.h"

@interface playViewController ()

@end

@implementation playViewController
@synthesize sponsor;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)shuffle:(NSMutableArray*)anArray
{
    
    NSMutableArray* numeriEstratti = [[NSMutableArray alloc] initWithCapacity:3];
    for (NSUInteger i = 0; i < 3; ++i) {
        NSNumber* ospitoInteger;
        do {
            int n = arc4random_uniform([[startup objectForKey:@"foto"] count]) ;
            
            ospitoInteger = [NSNumber numberWithInt:n];
            
        }
        while ([numeriEstratti containsObject:ospitoInteger]);
        [numeriEstratti addObject:ospitoInteger];
        [anArray addObject:[[startup objectForKey:@"foto"] objectAtIndex:[ospitoInteger intValue]]];
        [anArray addObject:[[startup objectForKey:@"foto"] objectAtIndex:[ospitoInteger intValue]]];
        
    }
    [numeriEstratti release];
    
    
    for (NSUInteger i = 0; i < anArray.count; ++i) {
        
        int nElements = anArray.count - i;
        
        int n = (arc4random() % nElements) + i;
        
        [anArray exchangeObjectAtIndex:i withObjectAtIndex:n];
        
    }

}

- (void)viewDidLoad
{
    NSString *strFilePath = [ [NSBundle mainBundle] pathForResource:@"startup" ofType:@"plist" ] ;
    startup= [[NSMutableDictionary alloc] initWithContentsOfFile:strFilePath];
    sponsor=[[NSMutableArray alloc] initWithObjects: nil];
    
    oggettiAperti=[[NSMutableArray alloc] initWithObjects: nil];
    indicidoppi=[[NSMutableArray alloc] initWithObjects: nil];
    [self shuffle:sponsor];
    visibile=NO;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return [sponsor count];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    cellaView *Cell = [collectionView
                                 dequeueReusableCellWithReuseIdentifier:@"cella_play"
                                 forIndexPath:indexPath];
    [Cell rendivisibile:visibile];
    
    
    NSString *immagine=[NSString stringWithFormat:@"%@",[sponsor objectAtIndex:indexPath.row]];
    [Cell.imageView setImage:[UIImage imageNamed:immagine]];
    if (visibile) {
        [oggettiAperti addObject:immagine];
    }
    
       
    return Cell;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
        
    if (!visibile) {
        visibile=YES;
        //indice=indexPath;
    }
    else
        visibile=NO;
    
    indicino=[[NSArray alloc] initWithObjects:indexPath, nil];
    [self.collectionView reloadItemsAtIndexPaths:indicino];
    [indicidoppi addObject:indexPath];
    
    visibile=NO;
    [self memory];
    
}

-(void)memory{
    
    if (oggettiAperti.count==2) {
        
        
        if (![[indicidoppi objectAtIndex:(indicidoppi.count-1)] isEqual:[indicidoppi objectAtIndex:(indicidoppi.count-2)]]) {
            
            if ([[oggettiAperti objectAtIndex:0] isEqualToString:[oggettiAperti objectAtIndex:1]]) {
                
                dettaglioViewController *detailView=[self.storyboard instantiateViewControllerWithIdentifier:@"detailView"];
                //dettaglioViewController *detailView=[[[dettaglioViewController alloc]init]autorelease];
                //[detailView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
                [detailView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
                [self presentModalViewController:detailView animated:YES];
                NSString*titol=[NSString stringWithFormat:@"%@",[[oggettiAperti objectAtIndex:0] stringByReplacingOccurrencesOfString:@".png" withString:@""]];
                detailView.titolo.text=titol;
                [detailView.logo setImage:[UIImage imageNamed:[oggettiAperti objectAtIndex:0]]];
                
                for (int i=0; i<[[startup objectForKey:@"foto"] count]; i++) {
                   if([[NSString stringWithFormat:@"%@",[oggettiAperti objectAtIndex:0]] isEqualToString:[[startup objectForKey:@"foto"] objectAtIndex:i]])
                       detailView.descrizione.text=[[startup objectForKey:@"descrizione"] objectAtIndex:i];
                }
                
                oggettiAperti=[[NSMutableArray alloc] initWithObjects: nil];
                
            }
            
            else
            {
                indicino=[[NSArray alloc] initWithObjects:[indicidoppi objectAtIndex:(indicidoppi.count -1)],[indicidoppi objectAtIndex:(indicidoppi.count -2)], nil];
                oggettiAperti=[[NSMutableArray alloc] initWithObjects: nil];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_current_queue(), ^{
                    
                    [self.collectionView reloadItemsAtIndexPaths:indicino];
                });
                
                [indicidoppi removeLastObject];
                [indicidoppi removeLastObject];
                
                
            }
        }
        else{
            [oggettiAperti removeLastObject];
            [indicidoppi removeLastObject];
        }
        
        
        
    }
    
    if (indicidoppi.count==sponsor.count) {
        /*
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"HAI VINTO!" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        [alert release];*/
        sponsor=[[NSMutableArray alloc] initWithObjects: nil];
        [self shuffle:sponsor];
        [indicidoppi removeAllObjects];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_current_queue(), ^{
            [self.collectionView reloadData] ;
        });
    }
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [startup release];
    [indicidoppi release];
    [indicino release];
    [sponsor release];
    [oggettiAperti release];
    [super dealloc];
}

@end
