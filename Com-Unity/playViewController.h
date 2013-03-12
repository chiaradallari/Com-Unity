//
//  playViewController.h
//  Com-Unity
//
//  Created by Stardust on 05/02/13.
//  Copyright (c) 2013 Viviana Liuni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cellaView.h"
#import "dettaglioViewController.h"

@interface playViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIAlertViewDelegate>{
    
    NSMutableArray *sponsor;
    NSMutableArray *oggettiAperti;
    NSMutableArray* indicidoppi;
    BOOL visibile;
    NSArray* indicino;
    NSMutableDictionary *startup;
}

@property(nonatomic,retain) NSMutableArray *sponsor;
-(void)shuffle:(NSMutableArray*)anArray;
-(void)memory;
@end
