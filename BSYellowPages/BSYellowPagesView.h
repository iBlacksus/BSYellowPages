//
//  BSYellowPagesView.h
//  BSYellowPages
//
//  Created by iBlacksus on 10/17/15.
//  Copyright © 2015 iBlacksus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSYellowPagesView : UIView <UIScrollViewDelegate>

@property (nonatomic) IBInspectable NSInteger pageWidth;
@property (nonatomic) IBInspectable NSInteger pageHeight;
@property (nonatomic) IBInspectable NSInteger yellowPageWidth;
@property (nonatomic) IBInspectable NSInteger yellowPageHeight;
@property (nonatomic) IBInspectable NSInteger widthBetweenPages;
@property (nonatomic) IBInspectable UIColor *outherColor;
@property (nonatomic) IBInspectable UIColor *innerColor;

- (void)createYellowPagesWithScrollView:(UIScrollView *)scrollView;

@end
