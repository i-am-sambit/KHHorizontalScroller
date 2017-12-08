//
//  ScrollBannerView.m
//  AwesomeIOS
//
//  Created by GLB-311-PC on 01/12/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "ScrollBannerView.h"

@interface ScrollBannerView()

@property (weak, nonatomic) IBOutlet UIImageView *bannerImageView;

@end

@implementation ScrollBannerView

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    if (self == [super initWithCoder:aDecoder]) {
        [self loadUI];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addObserver:self forKeyPath:@"questionIndex" options:NSKeyValueObservingOptionNew context:nil];
        [self loadUI];
    }
    return self;
}

- (void) loadUI {
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"ScrollBannerView" owner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;
}

- (void) setBannerImage:(UIImage *)bannerImage {
    _bannerImageView.image = bannerImage;
}

@end
