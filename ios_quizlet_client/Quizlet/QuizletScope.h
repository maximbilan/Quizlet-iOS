//
//  QuizletScope.h
//  ios_quizlet_client
//
//  Created by Maxim Bilan on 8/18/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//
//  Latest code can be found on GitHub: https://github.com/maximbilan/ios_quizlet_client
//

typedef NS_ENUM(NSInteger, QuizletScope)
{
    QuizletScopeRead,
    QuizletScopeWriteSet,
    QuizletScopeWriteGroup
};

static NSString * const QuizletScopeValues[] = { @"read", @"write_set", @"write_group" };