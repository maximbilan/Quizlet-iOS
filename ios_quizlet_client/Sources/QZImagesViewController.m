//
//  QZImagesViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/28/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZImagesViewController.h"

#import "Quizlet.h"

@interface QZImagesViewController ()

@property (weak, nonatomic) IBOutlet UITextView *logTextView;

@end

@implementation QZImagesViewController

#pragma mark - View Controller Methods

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.logTextView.text = @"";
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"image1" ofType:@"jpg"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:imagePath];
    
    [[Quizlet sharedQuizlet] uploadImageFromURLs:@[url, url] success:^(id responseObject) {
        self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
    } failure:^(NSError *error) {
        self.logTextView.text = [error description];
    }];
}

@end
