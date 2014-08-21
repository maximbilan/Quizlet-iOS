//
//  QZSetsViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/21/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZSetsViewController.h"
#import "QZExamplesViewController.h"

#import "Quizlet.h"

@interface QZSetsViewController ()

@property (weak, nonatomic) IBOutlet UITextView *logTextView;
@property (weak, nonatomic) IBOutlet UITextField *setIdTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation QZSetsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.logTextView.text = @"";
    
    switch (self.exampleId) {
        case QZExamplesViewSet:
        case QZExamplesViewSetTerms:
        case QZExamplesSubmitSetPassword:
        {
            self.setIdTextField.hidden = NO;
            self.submitButton.hidden = NO;
        }
        break;
        
        case QZExamplesViewSets:
        {
            [[Quizlet sharedQuizlet] viewSets:^(id responseObject) {
                self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
            } failure:^(NSError *error) {
                self.logTextView.text = [error description];
            }];
        }
        break;
        case QZExamplesAddSet:
        case QZExamplesEditSet:
        case QZExamplesDeleteSet:
        case QZExamplesAddTermToSet:
        case QZExamplesEditTermFromSet:
        case QZExamplesDeleteTermFromSet:
        {
        
        }
        break;
            
        default:
            break;
    }
}

- (IBAction)submitButtonAction:(UIButton *)sender
{
    [self.setIdTextField resignFirstResponder];
    
    if (self.setIdTextField.text.length > 0) {
        switch (self.exampleId) {
            case QZExamplesViewSet:
            {
                [[Quizlet sharedQuizlet] viewSetById:self.setIdTextField.text success:^(id responseObject) {
                    self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                } failure:^(NSError *error) {
                    self.logTextView.text = [error description];
                }];
            }
            break;
            
            case QZExamplesViewSetTerms:
            {
                [[Quizlet sharedQuizlet] viewSetTermsById:self.setIdTextField.text success:^(id responseObject) {
                    self.logTextView.text = [NSString stringWithFormat:@"%@", responseObject];
                } failure:^(NSError *error) {
                    self.logTextView.text = [error description];
                }];
            }
            break;
                
            case QZExamplesSubmitSetPassword:
            {
                [[Quizlet sharedQuizlet] submitPasswordBySetId:self.setIdTextField.text success:^(id responseObject) {
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
