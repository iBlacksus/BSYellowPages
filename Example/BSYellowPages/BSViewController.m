//
//  ViewController.m
//  BSYellowPages
//
//  Created by iBlacksus on 10/17/15.
//  Copyright © 2015 iBlacksus. All rights reserved.
//

#import "BSViewController.h"
#import "BSYellowPagesView.h"

static NSInteger const kPagesCount = 5;

@interface BSViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet BSYellowPagesView *yellowPagesView;

@end

@implementation BSViewController

#pragma mark - Life cycle -

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self configureScrollView];
    [self.yellowPagesView createYellowPagesWithScrollView:self.scrollView];
    [self createSampleViews];
}

#pragma mark - Privat methods -

- (void)configureScrollView
{
    CGFloat width = CGRectGetWidth(self.scrollView.frame)*kPagesCount;
    CGFloat height = CGRectGetHeight(self.scrollView.frame);
    self.scrollView.contentSize = CGSizeMake(width, height);
}

- (void)createSampleViews
{
    CGFloat width = CGRectGetWidth(self.scrollView.frame);
    CGFloat height = CGRectGetHeight(self.scrollView.frame);
    
    for (NSInteger i=0; i < kPagesCount; i++) {
        CGFloat x = CGRectGetWidth(self.scrollView.frame) * i;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, 0.f, width, height)];
        view.backgroundColor = [UIColor colorWithWhite:1.f - 1.f/kPagesCount*(i+1) alpha:1.f];
        [self.scrollView addSubview:view];
    }
}

@end
