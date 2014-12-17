//
//  AMMenueScrollViewCell.h
//  Schalke Klickdummy
//
//  Created by Bernhard Harrer on 17.12.14.
//  Copyright (c) 2014 Appmaker. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AMMenuScrollViewCellDeleagte;
@interface AMMenuScrollViewCell : UIView



@property (nonatomic,readwrite) NSInteger index;

@property (nonatomic,weak) id<AMMenuScrollViewCellDeleagte> delegate;

@end

@protocol AMMenuScrollViewCellDeleagte

- (void)didSelectCellAtIndex:(NSInteger)index;

@end
