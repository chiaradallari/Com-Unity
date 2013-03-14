//
//  cellaView.m
//  Com-Unity
//
//  Created by Stardust on 05/02/13.
//  Copyright (c) 2013 Viviana Liuni. All rights reserved.
//

#import "cellaView.h"

@implementation cellaView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(void)rendivisibile:(BOOL)vedo
{
    if (vedo) {
        self.imageView.hidden=NO;
    }
    else
        self.imageView.hidden=YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
