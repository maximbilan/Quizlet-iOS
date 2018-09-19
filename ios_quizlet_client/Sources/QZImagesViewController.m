//
//  QZImagesViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/28/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZImagesViewController.h"

#import "Quizlet.h"

#import "WaitSpinner.h"

@interface QZImagesViewController ()

@property (strong, nonatomic) WaitSpinner *waitSpinner;
@property (weak, nonatomic) IBOutlet UITextView *logTextView;

@end

@implementation QZImagesViewController

#pragma mark - View Controller Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.waitSpinner = [[WaitSpinner alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.logTextView.text = @"";
    
    [self.waitSpinner showInView:self.view];
	
	__weak QZImagesViewController *weakSelf = self;
	
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"image1" ofType:@"jpg"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:imagePath];
    
    [[Quizlet sharedQuizlet] uploadImageFromURLs:@[url, url] success:^(id responseObject) {
        weakSelf.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
        [weakSelf.waitSpinner hide];
    } failure:^(NSError *error) {
        weakSelf.logTextView.text = [error description];
        [weakSelf.waitSpinner hide];
    }];
}

@end
