//
//  UIView+RoundView.h
//
//  Created by iBlacksus on 10/17/15.
//  Copyright (c) 2015 iBlacksus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RoundView)

- (void)roundView;
- (void)roundViewCorners;
- (void)roundViewCornersHalfHeight;
- (void)roundViewCornersWithRadius:(CGFloat)radius;
- (void)borderWithColor:(UIColor *)color;

@end
