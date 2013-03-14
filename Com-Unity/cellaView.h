//
//  cellaView.h
//  Com-Unity
//
//  Created by Stardust on 05/02/13.
//  Copyright (c) 2013 Viviana Liuni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellaView : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
-(void)rendivisibile:(BOOL)visibile;
@end
