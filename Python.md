
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
    yield, in, is, global, nonlocal.
    
 6. Namespaces and scope :-
 
    A namespace is a system to have a unique name for each and every object in Python.
    A lifetime of a namespace depends upon the scope of objects.
    
 7. Statement, Indentation and Comment in Python :-

    One of the distinctive features of Python is its use of indentation to highlight the blocks of code. Whitespace is used for indentation.
    
 8. Structuring Python Programs :-
 
     Implicit line continuation :- parentheses (‘(‘), brackets (‘[‘), or curly braces (‘{‘) is presumed to be incomplete until all matching parentheses, square brackets, and curly braces have been encountered.

     Explicit line continuation :- Backslash (\) is used to indicate that a statement spans more than one line (as in shell).

## II. Input/Output
 1. Taking input in Python
   ```   
     raw_input ( prompt ) -- 2.x
     input ( prompt )     -- 3.x   --> stores any input to string, need to typecast for further use.
   ```  
  2. Taking input from console in Python  
   ```  
     input1 = input()   --> watis until user gives the input from the console.
   ```
   
  3. Taking multiple inputs from user in Python
   ```  
     using split
     eg: x, y, z = input("Enter a three value: ").split() --> space is considered as separator by default
   ```
  4. Output using print() function
  
     Syntax: print(value(s), sep= ‘ ‘, end = ‘\n’, file=file, flush=flush)
     values will be converted to string before printing. by default end value is always '\n' , to print 2 objects with space only we need to give end=" ".
   ```  
     eg:  print("geeks", end =" ") 
          print("geeksforgeeks") 
          
          o/p : geeks geeksforgeeks
   ```

## III. Data Types
