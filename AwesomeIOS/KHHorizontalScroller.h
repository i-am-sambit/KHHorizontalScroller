//
//  HorizontalScroller.h
//  HashtagUsersTwitter
//
//  Created by GLB-311-PC on 23/11/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KHHorizontalScrollerCell.h"

IB_DESIGNABLE
@class KHHorizontalScroller;

/* *
 * Declare Horizontal scroller class
 * Create Horizontal Scroller Delegates and data sources
 * */
@protocol KHHorizontalScrollerDelegate <NSObject>

@required
- (NSInteger) numberOfViewsForHorizontalScroller:(KHHorizontalScroller *)scroller;
- (CGSize) contentSizeForView:(KHHorizontalScroller *)scroller;
- (KHHorizontalScrollerCell *) horizontalScroller:(KHHorizontalScroller *)scroller viewAtIndex:(int)index;
- (void) horizontalScroller:(KHHorizontalScroller*)scroller clickedViewAtIndex:(int)index;

@optional
- (NSInteger) initialViewIndexForHorizontalScroller:(KHHorizontalScroller*)scroller;

@end

/* *
 *
 * */
@interface KHHorizontalScroller : UIView

@property (weak, nonatomic) id <KHHorizontalScrollerDelegate> delegate;

@property (assign, nonatomic) IBInspectable int index;
@property (assign, nonatomic) IBInspectable int cornerRadius;
@property (assign, nonatomic) IB_DESIGNABLE int selectionType;
@property (assign, nonatomic) IB_DESIGNABLE int prototypeCell;

@property (strong, nonatomic) NSArray *scrollerTitles;

typedef enum {
    KHSelectionBarUp,
    KHSelectionBarDown,
    KHSelectionBarNone
} KHSelectionLocationBar;

- (void) reload;

@end
