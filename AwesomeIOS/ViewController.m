//
//  ViewController.m
//  AwesomeIOS
//
//  Created by GLB-311-PC on 01/12/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "ViewController.h"
#import "KHHorizontalScroller.h"
#import "ScrollBannerView.h"
#import "CollectionViewCell.h"

@interface ViewController () <KHHorizontalScrollerDelegate> {
    NSArray *headerTitleArray;
}

@property (weak, nonatomic) IBOutlet KHHorizontalScroller *mainTabView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mainTabView.delegate = self;
    _mainTabView.scrollerTitles = @[@"Followers", @"Followings"];
    [_mainTabView reload];
}

#pragma mark : Horizontal Scroller Delegates
/* Set Number of cells */
- (NSInteger)numberOfViewsForHorizontalScroller:(KHHorizontalScroller*)scroller {
    return scroller.scrollerTitles.count;
}

/* Set cell content size */
- (CGSize) contentSizeForView:(KHHorizontalScroller *)scroller {
    return CGSizeMake(scroller.bounds.size.width/2, scroller.bounds.size.height);
}

/* Set Horizontal Scroller view cell */
- (KHHorizontalScrollerCell *)horizontalScroller:(KHHorizontalScroller*)scroller viewAtIndex:(int)index {
    
    KHHorizontalScrollerCell *cell = [[KHHorizontalScrollerCell alloc] initWithFrame:CGRectMake(0, 0, scroller.bounds.size.width/2, scroller.bounds.size.height)];
    
//    cell.titleLabel.text = [scroller.scrollerTitles objectAtIndex:index];
    
//    if (scroller.index == index) {
//        cell.selectedIndexView.backgroundColor = [UIColor whiteColor];
//    }
//    else {
//        cell.selectedIndexView.backgroundColor = [UIColor clearColor];
//    }
    return cell;
}

/* cell clicked action */
- (void)horizontalScroller:(KHHorizontalScroller *)scroller clickedViewAtIndex:(int)index {
    [scroller reload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
