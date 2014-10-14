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
    NSURL *url = [NSURL URLWithString:imagePath];
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:imagePath];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithContentsOfFile:[url absoluteString]];
    
    [[Quizlet sharedQuizlet] uploadImageFromURL:fileURL success:^(id responseObject) {
        self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
    } failure:^(NSError *error) {
        self.logTextView.text = [error description];
    }];
}

@end
