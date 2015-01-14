//
//  AMMenueScrollView.h
//  Schalke Klickdummy
//
//  Created by Bernhard Harrer on 17.12.14.
//  Copyright (c) 2014 Appmaker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMMenuScrollViewCell.h"

@protocol AMMenuScrollViewDelegate;
@protocol AMMenuScrollViewDataSource;

@interface AMMenuScrollView : UIScrollView <UIScrollViewDelegate,AMMenuScrollViewCellDeleagte>

@property (nonatomic,weak) IBOutlet id<AMMenuScrollViewDataSource> dataSource;
@property (nonatomic,weak) IBOutlet id<AMMenuScrollViewDelegate> menueDelegate;

- (void)scrollToItem:(NSInteger)index;
- (void)loadView;

@end

@protocol AMMenuScrollViewDelegate

- (void)menuScrollView:(AMMenuScrollView *)menuScrollView didSelectItemAtIndex:(NSInteger)index;

@end

@protocol AMMenuScrollViewDataSource

- (AMMenuScrollViewCell *)menuScrollView:(AMMenuScrollView *)menuScrollView cellForItem:(NSInteger)index;
- (NSInteger)numberOfItems;

@end
