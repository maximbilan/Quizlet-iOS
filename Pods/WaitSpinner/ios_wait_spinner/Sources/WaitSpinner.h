//
//  WaitSpinner.h
//  ios_heart_rate_monitor
//
//  Created by Maxim Bilan on 1/25/14.
//  Copyright (c) 2014 Maxim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WaitSpinner : NSObject

- (void)showInView:(UIView *)view;
- (void)hide;

@end
