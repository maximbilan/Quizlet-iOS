//
//  QZUsersViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/20/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZUsersViewController.h"
#import "QZExamplesViewController.h"

#import "Quizlet.h"

@interface QZUsersViewController ()

@property (weak, nonatomic) IBOutlet UITextView *logTextView;
@property (weak, nonatomic) IBOutlet UITextField *setIdTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation QZUsersViewController

#pragma mark - View Controller Methods

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.logTextView.text = @"";
    
    switch (self.exampleId) {
        case QZExamplesUserDetails:
        {
            [[Quizlet sharedQuizlet] userDetails:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesUserSets:
        {
            [[Quizlet sharedQuizlet] userSets:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesUserFavorites:
        {
            [[Quizlet sharedQuizlet] userFavorites:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesUserClasses:
        {
            [[Quizlet sharedQuizlet] userClasses:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesUserStudied:
        {
            [[Quizlet sharedQuizlet] userStudied:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
            
        case QZExamplesMarkSetAsFavorite:
        case QZExamplesUnmarkSetAsFavorite:
        {
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
        switch (self.exampleId) {
            case QZExamplesMarkSetAsFavorite:
            {
                [[Quizlet sharedQuizlet] markUserSetAsFavoriteById:self.setIdTextField.text success:^(id responseObject) {
                    self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                } failure:^(NSError *error) {
                    self.logTextView.text = [error description];
                }];
            }
            break;
            
            case QZExamplesUnmarkSetAsFavorite:
            {
                [[Quizlet sharedQuizlet] unmarkUserSetAsFavoriteById:self.setIdTextField.text success:^(id responseObject) {
                    self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                } failure:^(NSError *error) {
                    self.logTextView.text = [error description];
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
