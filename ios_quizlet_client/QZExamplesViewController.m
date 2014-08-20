//
//  QZExamplesViewController.m
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/20/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import "QZExamplesViewController.h"

static NSString * const QZExamplesNames[] = {
    @"GET /classes/CLASS_ID - View a single class.",
    @"GET /classes/CLASS_ID/sets - View full details of all sets in a class.",
    @"POST /classes - Add a new class.",
    @"PUT /classes/CLASS_ID - Edit a class.",
    @"DELETE /classes/CLASS_ID - Delete a class.",
    @"PUT /classes/CLASS_ID/sets/SET_ID - Add a set to a class.",
    @"DELETE /classes/CLASS_ID/sets/SET_ID - Remove a set from a class.",
    @"PUT /classes/CLASS_ID/members/USERNAME - Join (or apply to join) a class.",
    @"DELETE /classes/CLASS_ID/members/USERNAME - Leave a class.",
    @"POST /images - Upload one or more images.",
    @"GET /search/sets - Search for sets by title, description or term. Returns limited information.",
    @"GET /search/definitions - Search for definitions.",
    @"GET /search/classes - Search for classes by their title and description.",
    @"GET /search/universal - Search for classes, users, and sets all together",
    @"GET /sets/SET_ID - View complete details (including all terms) of a single set.",
    @"GET /sets/SET_ID/terms - View just the terms in a single set.",
    @"GET /sets/SET_ID/password - Submit a password for a password-protected set.",
    @"GET /sets - View complete details of multiple sets at once.",
    @"POST /sets - Add a new set",
    @"PUT /sets/SET_ID - Edit an existing set",
    @"DELETE /sets/SET_ID - Delete an existing set",
    @"POST /sets/SET_ID/terms - Add a single term to a set",
    @"PUT /sets/SET_ID/terms/TERM_ID - Edit a single term within a set",
    @"DELETE /sets/SET_ID/terms/TERM_ID - Delete a single term within a set",
    @"GET /users/USERNAME - View basic user information, including their sets, favorites, last 25 sessions, etc.",
    @"GET /users/USERNAME/sets - View complete details about all the user's created sets.",
    @"GET /users/USERNAME/favorites - View complete details about all the user's favorited sets.",
    @"GET /users/USERNAME/classes - View complete details about all the classes that the user is a member of.",
    @"GET /users/USERNAME/studied - View the last 100 recently studied sessions for a user.",
    @"PUT /users/USERNAME/favorites/SET_ID - Mark a set as a favorite.",
    @"DELETE /users/USERNAME/favorites/SET_ID - Unmark a set as a favorite."
};

@interface QZExamplesViewController ()

@end

@implementation QZExamplesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
