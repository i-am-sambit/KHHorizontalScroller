//
//  KHHorizontalScrollerCell.m
//  iOSTask
//
//  Created by Neeraj Sonaro on 29/11/17.
//  Copyright © 2017 SambitPrakash. All rights reserved.
//

#import "KHHorizontalScrollerCell.h"

@interface KHHorizontalScrollerCell ()

@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIView *view;

@end

@implementation KHHorizontalScrollerCell

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI:frame];
    }
    return self;
}


- (void) createUI:(CGRect) frame {
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    containerView.backgroundColor = [UIColor clearColor];
    [self addSubview:containerView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, containerView.frame.size.width, containerView.frame.size.height - 2)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont fontWithName:@"Optima" size:18];
    _titleLabel.numberOfLines = 0;
    _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [containerView addSubview:_titleLabel];
    
    _selectedIndexView = [[UIView alloc] initWithFrame:CGRectMake(0, _titleLabel.frame.origin.y + _titleLabel.frame.size.height, _titleLabel.frame.size.width, 2)];
    [containerView addSubview:_selectedIndexView];
}

@end
