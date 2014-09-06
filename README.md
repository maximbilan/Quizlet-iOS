iOS Quizlet Client
==================

iOS client for working with Quizlet API 2.0<br>
<br>
The Quizlet API lets developers interested in building study tools to interact with Quizlet's vast content database of over 1640 million flashcards. The Quizlet API lets you create, search, and modify flashcard sets and classes, and much more in your own application.
<br>

I provide simple iOS example, which contains all possible requests to Quizlet API.
Example for now not completed, working in progress. Now we have only iPhone interface, and there aren't all user interface for requests.

How to use this framework:

First of all, you sholud copy Quizlet folder to your project.

<pre>
Quizlet.h
Quilzet.m
QuizletConfig.h
QuizletScope.h
QuizletRequest.h
QuizletRequest.m
QuizletResponse.h
QuizletAuth.h
QuizletAuth.m
QuizletClasses.h
QuizletClasses.m
QuizletImages.h
QuizletImages.m
QuizletSearch.h
QuizletSearch.m
QuizletSets.h
QuizletSets.m
QuizletUsers.h
QuizletUsers.m
</pre>

This framework requires AFNetworking 2.0. You can easily use other libraries, AFNetwoking used only in QuizletRequest class. And I think it's not a big problem will change code of http requests.


<br>
Working with Classes, Searching, Sets, Users API.<br>
Not completed with Images API.<br>
<br>
Example interface only for iPhone.
