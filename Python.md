
Geeks for geeks  --->  https://www.geeksforgeeks.org/python-programming-language/

Hacker rank      ---> https://www.hackerrank.com/domains/python

*** 

## I. Basics 

1. Python Language Introduction :-

   In a Python script to print something on the console print() function is used – it simply prints out a line ( and also includes a newline unlike in C ). 
   
2. Python3 basics :-
   
   Python for its scope doesn’t depend on the braces ( { } ), instead it uses indentation for its scope.
   In other programming languages like C, C++ and Java, you will need to declare the type of variables but in Python you don’t need to do that.
   
   ```
   eg:-   mynum=4.5
          print(mynum)      

          o/p : 4.5
   ```
   
   Python have 4 types of built in Data Structures namely List, Dictionary, Tuple and Set.
   
   ```   
   # is used for single line comment in Python
   """ this is a comment """ is used for multi line comments
   ```

   `input()` is used to get input from the console, need to specify the datatype if we need to perform operations on the read data.
   Python used the keyword `def` to define a function.  ` eg:- def hello(): `

   Python has a very rich module library that has several functions to do many tasks. 
   `import` keyword is used to import a particular module into your python code. 

3. Python – The new generation Language :-

   Concise, Interpreted language, Rich library support, Platform independent.
 
 4. Differences between Python 2.x and 3.x :-
 
    If we are planning Python 3.x support in 2.x code, we can use_future_ imports it in the code.
    
 5. Keywords in Python | Set 1 & Set 2
 
    True, False, None, and, or, not, assert, break, continue, def, if, elif, else, del
    try, except, finally, raise, while, pass, for, import, from, as, lambda, return
    yield, in, is, global, nonlocal
 

## II. Input/Output
 1. Taking input in Python
   ```   
     raw_input ( prompt ) -- 2.x
     input ( prompt )     -- 3.x   --> stores any input to string, need to typecast for further use.
   ```  
