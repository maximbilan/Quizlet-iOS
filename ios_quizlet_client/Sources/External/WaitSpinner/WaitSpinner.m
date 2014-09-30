//
//  WaitSpinner.m
//  ios_heart_rate_monitor
//
//  Created by Maxim Bilan on 1/25/14.
//  Copyright (c) 2014 Maxim. All rights reserved.
//

#import "WaitSpinner.h"

@interface WaitSpinner ()
{
    UIActivityIndicatorView *spinner;
    UIView *spinnerView;
}

@end

@implementation WaitSpinner

- (void)showInView:(UIView *)view
{
    spinnerView = view;
    if (!spinner) {
        spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        CGRect rect = [spinnerView bounds];
        spinner.center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
        spinner.hidesWhenStopped = YES;
    }
    
    [spinnerView setUserInteractionEnabled:NO];
    [spinnerView addSubview:spinner];
    [spinner startAnimating];
}

- (void)hide
{
    [spinnerView setUserInteractionEnabled:YES];
    [spinnerView setNeedsDisplay];
    [spinner stopAnimating];
}

@end
