//
//  UIView+RoundView.m
//
//  Created by iBlacksus on 10/17/15.
//  Copyright (c) 2015 Borodutch Studio. All rights reserved.
//

#import "UIView+RoundView.h"

@implementation UIView (RoundView)

- (void)roundView
{
    [self roundViewCornersWithRadius:self.frame.size.width / 2.f];
}

- (void)roundViewCorners
{
    [self roundViewCornersWithRadius:10.f];
}

- (void)roundViewCornersHalfHeight
{
    [self roundViewCornersWithRadius:self.frame.size.height / 2.f];
}

- (void)roundViewCornersWithRadius:(CGFloat)radius
{
    self.layer.drawsAsynchronously = YES;
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

- (void)borderWithColor:(UIColor *)color
{
    self.layer.drawsAsynchronously = YES;
    self.layer.borderWidth = 1.f;
    self.layer.borderColor = color.CGColor;
}

@end
