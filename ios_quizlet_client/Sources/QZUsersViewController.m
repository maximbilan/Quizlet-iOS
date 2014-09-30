//
//  QZUsersViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/20/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZUsersViewController.h"
#import "QZExamplesViewController.h"

#import "WaitSpinner.h"

#import "Quizlet.h"
#import "QuizletImages.h"

@interface QZUsersViewController ()
{
    WaitSpinner *waitSpinner;
}

@property (weak, nonatomic) IBOutlet UITextView *logTextView;
@property (weak, nonatomic) IBOutlet UITextField *setIdTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation QZUsersViewController

#pragma mark - View Controller Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    waitSpinner = [[WaitSpinner alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.logTextView.text = @"";
    
    [waitSpinner showInView:self.view];
    
    switch (self.exampleId) {
        case QZExamplesUserDetails:
        {
            [[Quizlet sharedQuizlet] userDetails:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [waitSpinner hide];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
                [waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesUserSets:
        {
            [[Quizlet sharedQuizlet] userSets:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [waitSpinner hide];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
                [waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesUserFavorites:
        {
            [[Quizlet sharedQuizlet] userFavorites:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [waitSpinner hide];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
                [waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesUserClasses:
        {
            [[Quizlet sharedQuizlet] userClasses:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [waitSpinner hide];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
                [waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesUserStudied:
        {
            [[Quizlet sharedQuizlet] userStudied:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                [waitSpinner hide];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
                [waitSpinner hide];
            }];
        }
        break;
            
        case QZExamplesMarkSetAsFavorite:
        case QZExamplesUnmarkSetAsFavorite:
        {
            [waitSpinner hide];
            self.setIdTextField.hidden = NO;
            self.submitButton.hidden = NO;
        }
        break;
            
        default:
            break;
    }
}

#pragma mark - Actions

- (IBAction)submitButtonAction:(UIButton *)sender
{
    [self.setIdTextField resignFirstResponder];
    
    if (self.setIdTextField.text.length > 0) {
        
        [waitSpinner showInView:self.view];
        
        switch (self.exampleId) {
            case QZExamplesMarkSetAsFavorite:
            {
                [[Quizlet sharedQuizlet] markUserSetAsFavoriteBySetId:self.setIdTextField.text success:^(id responseObject) {
                    self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                    [waitSpinner hide];
                } failure:^(NSError *error) {
                    self.logTextView.text = [error description];
                    [waitSpinner hide];
                }];
            }
            break;
            
            case QZExamplesUnmarkSetAsFavorite:
            {
                [[Quizlet sharedQuizlet] unmarkUserSetAsFavoriteBySetId:self.setIdTextField.text success:^(id responseObject) {
                    self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                    [waitSpinner hide];
                } failure:^(NSError *error) {
                    self.logTextView.text = [error description];
                    [waitSpinner hide];
                }];
            }
            break;
            
            default:
                break;
        }
        
        self.setIdTextField.hidden = YES;
        self.submitButton.hidden = YES;
    }
}

@end
