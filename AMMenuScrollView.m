//
//  AMMenueScrollView.m
//  Schalke Klickdummy
//
//  Created by Bernhard Harrer on 17.12.14.
//  Copyright (c) 2014 Appmaker. All rights reserved.
//

#import "AMMenuScrollView.h"

@interface AMMenuScrollView ()

@property (nonatomic,strong) NSMutableArray *items;
@property (nonatomic,readwrite) long currentPage;

@end

@implementation AMMenuScrollView

- (id)initWithFrame:(CGRect)frame
{
  
    self = [super initWithFrame:frame];
    if (self) {
        _items = [[NSMutableArray alloc] init];
        [self setDelegate:self];
        self.pagingEnabled = NO;
    }
    return self;

}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _items = [[NSMutableArray alloc] init];
        [self setDelegate:self];
        self.pagingEnabled = NO;
    }
    return self;
}

- (void)setDelegate:(id<AMMenuScrollViewDelegate>)delegate
{
    self.menueDelegate = delegate;
    [super setDelegate:self];
}


- (void)awakeFromNib
{
    [self reloadItems];
    [self renderItems];
}


- (void)renderItems
{
    
    CGPoint centerStartPosition = CGPointMake((self.frame.size.width / 2), self.frame.size.height / 2);
    
    [self.items enumerateObjectsUsingBlock:^(AMMenuScrollViewCell *cell, NSUInteger idx, BOOL *stop) {
        CGPoint newCenter = CGPointMake(centerStartPosition.x * (idx + 1), centerStartPosition.y);
        [cell setIndex:idx];
        [cell setDelegate:self];
        [cell setCenter:newCenter];
        [self addSubview:cell];
        
    }];
    
}

- (void)scrollToItem:(NSInteger)index
{
    NSLog(@"Scroll to item");
    [self setContentOffset:CGPointMake(index * (self.frame.size.width / 2), 0) animated:YES];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}



//TODO: Don't load all items, only the needed ones
- (void)reloadItems
{
    NSInteger numberOfItems = [_dataSource numberOfItems];
    
    for (NSInteger i=0; i< numberOfItems; i++) {
        [self reloadItem:i];
    }
    
    [self setContentSize:CGSizeMake((numberOfItems + 1) * (self.frame.size.width / 2), self.frame.size.height)];
    
}

- (void)reloadItem:(NSInteger)index
{

    AMMenuScrollViewCell *cell = [_dataSource menuScrollView:self cellForItem:index];

    [self.items setObject:cell atIndexedSubscript:index];
    
}



#pragma mark - AMMenueScrollViewCellDelegate

- (void)didSelectCellAtIndex:(NSInteger)index
{
    [self setContentOffset:CGPointMake(index * (self.frame.size.width / 2), self.contentOffset.y) animated:YES];
    [self.menueDelegate menuScrollView:self didSelectItemAtIndex:index];
}

#pragma mark - UIScrollViewDelegate

- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = self.frame.size.width / 2;
    
    _currentPage = floor((self.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
}

-(void) scrollViewWillEndDragging:(UIScrollView*)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint*)targetContentOffset {
    
    CGFloat pageWidth = self.frame.size.width / 2;
    
    NSInteger newPage = _currentPage;
    
    if (velocity.x == 0) // slow dragging not lifting finger
    {
        newPage = floor((targetContentOffset->x - pageWidth / 2) / pageWidth) + 1;
    }
    else
    {
        newPage = velocity.x > 0 ? _currentPage + 1 : _currentPage - 1;
        
        if (newPage < 0)
            newPage = 0;
        if (newPage > self.contentSize.width / pageWidth)
            newPage = ceil(self.contentSize.width / pageWidth) - 1.0;
    }
    [self.menueDelegate menuScrollView:self didSelectItemAtIndex:newPage];
    *targetContentOffset = CGPointMake(newPage * pageWidth, targetContentOffset->y);
}


@end
