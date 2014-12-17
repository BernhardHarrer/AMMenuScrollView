//
//  AMMenueScrollViewCell.m
//  Schalke Klickdummy
//
//  Created by Bernhard Harrer on 17.12.14.
//  Copyright (c) 2014 Appmaker. All rights reserved.
//

#import "AMMenuScrollViewCell.h"

@implementation AMMenuScrollViewCell


- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellTapped)];
        [self addGestureRecognizer:tapGestureRecognizer];
    }
    return self;
    
}

- (void)cellTapped
{
    [self.delegate didSelectCellAtIndex:self.index];
}

@end
