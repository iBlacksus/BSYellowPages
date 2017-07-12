//
//  BSYellowPagesView.h
//  BSYellowPages
//
//  Created by iBlacksus on 10/17/15.
//  Copyright © 2015 iBlacksus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSYellowPagesView : UIView <UIScrollViewDelegate>

@property (assign, nonatomic) IBInspectable NSInteger pageWidth;
@property (assign, nonatomic) IBInspectable NSInteger pageHeight;
@property (assign, nonatomic) IBInspectable NSInteger yellowPageWidth;
@property (assign, nonatomic) IBInspectable NSInteger yellowPageHeight;
@property (assign, nonatomic) IBInspectable NSInteger widthBetweenPages;
@property (strong, nonatomic) IBInspectable UIColor *outherColor;
@property (strong, nonatomic) IBInspectable UIColor *innerColor;

- (void)createYellowPagesWithScrollView:(UIScrollView *)scrollView;

@end
