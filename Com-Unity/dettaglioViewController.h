//
//  dettaglioViewController.h
//  Com-Unity
//
//  Created by Stardust on 05/02/13.
//  Copyright (c) 2013 Viviana Liuni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dettaglioViewController : UIViewController
{
    IBOutlet UITextView *descrizione;
    IBOutlet UILabel *titolo;
    IBOutlet UIImageView *logo;
}

@property(nonatomic,retain) IBOutlet UITextView *descrizione;
@property(nonatomic,retain)IBOutlet UILabel *titolo;
@property(nonatomic,retain)IBOutlet UIImageView *logo;




@end
