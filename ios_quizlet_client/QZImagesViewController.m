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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.logTextView.text = @"";
    
    [[Quizlet sharedQuizlet] uploadImageFromURL:[NSURL URLWithString:@"image1.jpg"] success:^(id responseObject) {
        self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
    } failure:^(NSError *error) {
        self.logTextView.text = [error description];
    }];
}

@end
