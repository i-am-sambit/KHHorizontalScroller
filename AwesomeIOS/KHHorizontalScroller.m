//
//  HorizontalScroller.m
//  HashtagUsersTwitter
//
//  Created by GLB-311-PC on 23/11/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "KHHorizontalScroller.h"
#import "KHHorizontalScrollerCell.h"

#define VIEW_PADDING 0
#define VIEW_DIMENSIONS_WIDTH 150
#define VIEW_DIMENSIONS_HEIGHT 60
#define VIEWS_OFFSET 0

IB_DESIGNABLE
@interface KHHorizontalScroller () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scroller;

@end

@implementation KHHorizontalScroller

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    if (self == [super initWithCoder:aDecoder]) {
        [self loadUI];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addObserver:self forKeyPath:@"scrollerTitles" options:NSKeyValueObservingOptionNew context:nil];
        [self loadUI];
    }
    return self;
}

- (void) dealloc {
    [self removeObserver:self forKeyPath:@"scrollerTitles"];
}

- (void) loadUI {
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"KHHorizontalScroller" owner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    [self reload];
}

- (IBAction)scrollerTapped:(UITapGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:sender.view];
    for (int index=0; index<[self.delegate numberOfViewsForHorizontalScroller:self]; index++)
    {
        UIView *view = _scroller.subviews[index];
        if (CGRectContainsPoint(view.frame, location)) {
            
            if ([_delegate respondsToSelector:@selector(horizontalScroller:clickedViewAtIndex:)]) {
                _index = index;
                [_delegate horizontalScroller:self clickedViewAtIndex:index];
            }
            break;
        }
    }
}

- (void)reload {
    
    if (self.delegate == nil) {
        return;
    }
    
    //remove all subviews
    [_scroller.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj removeFromSuperview];
    }];
    
    CGFloat xValue = VIEWS_OFFSET;
    CGSize viewRect = CGSizeMake(self.bounds.size.width, 40);
    if ([_delegate respondsToSelector:@selector(contentSizeForView:)]) {
        viewRect = [_delegate contentSizeForView:self];
    }
    
    for (int i=0; i<[self.delegate numberOfViewsForHorizontalScroller:self]; i++) {
        
        xValue += VIEW_PADDING;
        KHHorizontalScrollerCell *cell = [self.delegate horizontalScroller:self viewAtIndex:i];
        cell.frame = CGRectMake(xValue, VIEW_PADDING, viewRect.width, viewRect.height);
        cell.titleLabel.text = [_scrollerTitles objectAtIndex:i];
        if (_index == i) {
            cell.selectedIndexView.backgroundColor = [UIColor whiteColor];
        }
        else {
            cell.selectedIndexView.backgroundColor = [UIColor clearColor];
        }
        
        [_scroller addSubview:cell];
        xValue += viewRect.width + VIEW_PADDING;
    }
    
    [_scroller setContentSize:CGSizeMake(xValue+VIEWS_OFFSET, self.frame.size.height)];
}

//- (void)centerCurrentView {
//    int xFinal = _scroller.contentOffset.x + (VIEWS_OFFSET/2) + VIEW_PADDING;
//    int viewIndex = xFinal / (viewRect.width + (2*VIEW_PADDING));
//    xFinal = viewIndex * (viewRect.width + (2*VIEW_PADDING));
//    [_scroller setContentOffset:CGPointMake(xFinal,0) animated:YES];
//}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
//        [self centerCurrentView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    [self centerCurrentView];
}

//- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    if (scrollView.contentOffset.x == 0) {
//        // user is scrolling to the left from image 1 to image 10.
//        // reposition offset to show image 10 that is on the right in the scroll view
//        [scrollView scrollRectToVisible:CGRectMake(600,0,150,480) animated:NO];
//    }
//    else if (scrollView.contentOffset.x == 125) {
//        // user is scrolling to the right from image 10 to image 1.
//        // reposition offset to show image 1 that is on the left in the scroll view
//        [scrollView scrollRectToVisible:CGRectMake(0,0,150,480) animated:NO];
//    }
//}

@end
