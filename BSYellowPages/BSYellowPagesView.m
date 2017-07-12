//
//  BSYellowPagesView.m
//  BSYellowPages
//
//  Created by iBlacksus on 10/17/15.
//  Copyright © 2015 iBlacksus. All rights reserved.
//

#import "BSYellowPagesView.h"
#import "UIView+RoundView.h"

static CGFloat const kDefaultPageWidth = 12.;
static CGFloat const kDefaultPageHeight = 12.;
static CGFloat const kDefaultYellowPageWidth = 6.;
static CGFloat const kDefaultYellowPageHeight = 6.;
static CGFloat const kDefaultWidthBetweenPages = 10.;

@interface BSYellowPagesView ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *pages;
@property (strong, nonatomic) NSMutableArray *yellowPages;

@end

@implementation BSYellowPagesView

#pragma mark - Life cycle -

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!_pageWidth) {
        _pageWidth = kDefaultPageWidth;
    }
    
    if (!_pageHeight) {
        _pageHeight = kDefaultPageHeight;
    }
    
    if (!_yellowPageWidth) {
        _yellowPageWidth = kDefaultYellowPageWidth;
    }
    
    if (!_yellowPageHeight) {
        _yellowPageHeight = kDefaultYellowPageHeight;
    }
    
    if (!_widthBetweenPages) {
        _widthBetweenPages = kDefaultWidthBetweenPages;
    }
    
    if (!_outherColor) {
        _outherColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.0];
    }
    
    if (!_innerColor) {
        _innerColor = [UIColor colorWithRed:0.9725 green:0.7059 blue:0.0 alpha:1.0];
    }
}

#pragma mark - UIScrollViewDelegate -

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self configureForOffsetX:scrollView.contentOffset.x];
}

#pragma mark - Public methods -

- (void)createYellowPagesWithScrollView:(UIScrollView *)scrollView {
    self.scrollView = scrollView;
    [self configure];
}

#pragma mark - Privat methods -

- (void)configureForOffsetX:(CGFloat)offsetX {
    CGFloat factorAllViews = self.scrollView.contentSize.width / (CGFloat)[self pagesWidth];
    CGFloat factorBetweenViews = self.scrollView.contentSize.width / self.widthBetweenPages;
    
    CGFloat newX = offsetX / factorAllViews + offsetX / factorBetweenViews;
    
    for (NSInteger i = 0; i < self.yellowPages.count; i++) {
        UIView *yellowView = self.yellowPages[i];
        
        CGRect frame = yellowView.frame;
        frame.origin.x = newX - (self.pageWidth + self.widthBetweenPages) * (CGFloat)i - (self.yellowPageWidth-self.pageWidth) / 2.;
        yellowView.frame = frame;
    }
}

- (void)configure {
    self.scrollView.delegate = self;
    [self createPages];
    [self configureForOffsetX:0.];
}

- (void)createPages {
    self.pages = [NSMutableArray array];
    self.yellowPages = [NSMutableArray array];
    
    CGFloat firstViewX = CGRectGetWidth(self.frame) / 2. - [self pagesWidth] / 2.;
    CGFloat y = CGRectGetHeight(self.frame) / 2. - self.pageHeight / 2.;
    
    for (NSInteger i=0; i < [self numberOfPages]; i++) {
        CGFloat x = firstViewX + (self.pageWidth + self.widthBetweenPages) * (CGFloat)i;
        
        // parent view
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, y, self.pageWidth, self.pageHeight)];
        view.backgroundColor = self.outherColor;
        view.clipsToBounds = YES;
        [view roundView];
        [self addSubview:view];
        [self.pages addObject:view];
        
        // yellow view
        CGFloat yellowPageX = -(self.yellowPageWidth - self.pageWidth) / 2.;
        CGFloat yellowPageY = -(self.yellowPageHeight - self.pageHeight) / 2.;
        UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(yellowPageX, yellowPageY, self.yellowPageWidth, self.yellowPageHeight)];
        yellowView.backgroundColor = self.innerColor;
        [yellowView roundView];
        [view addSubview:yellowView];
        [self.yellowPages addObject:yellowView];
    }
}

- (NSInteger)numberOfPages {
    CGFloat width = CGRectGetWidth(self.scrollView.frame);
    
    return self.scrollView.contentSize.width / width;
}

- (CGFloat)pagesWidth {
    CGFloat pagesCount = [self numberOfPages];
    return pagesCount * self.pageWidth + (pagesCount - 1) * self.widthBetweenPages;
}

@end
