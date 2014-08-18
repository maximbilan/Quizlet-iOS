//
//  QuizletScope.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

typedef NS_ENUM(NSInteger, QuizletScope)
{
    QuizletScopeRead,
    QuizletScopeWriteSet,
    QuizletScopeWriteGroup
};

static NSString * const QuizletScopeValues[] = { @"read", @"write_set", @"write_group"};