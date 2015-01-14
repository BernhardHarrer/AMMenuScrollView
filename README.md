#AMMenuScrollView

##Install

Add all Files to project:

* AMMenuScrollView.h
* AMMenuScrollView.m
* AMMenuScrollViewCell.h
* AMMenuScrollViewCell.m
 	
##Usage

Add a UIScrollView to your Storyboard. Change Class to AMMenuScrollView.

Set Outlets for dataSource and menueDelegate to your controller.

Add AMMenuScrollViewDelegate and AMMenuScrollViewDataSource protocols to the controller.

Add needed Methods for AMMenueScrollViewDataSource to your controller:

	- (NSInteger)numberOfItems
	- (AMMenuScrollViewCell *)menuScrollView:(AMMenuScrollView *)menuScrollView cellForItem:(NSInteger)index
	
Add needed Methods for AMMenueScrollViewDelegate to your controller:
	
	- (void)menuScrollView:(AMMenuScrollView *)menuScrollView didSelectItemAtIndex:(NSInteger)index
	