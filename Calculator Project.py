#!/usr/bin/env python
# coding: utf-8

# In[1]:


def add(x,y):
    return x + y

def subtract(x,y):
    return x - y

def multiply(x,y):
    return x * y

def divide(x,y):
    return x / y


# In[3]:


choice = input('Enter Choice: (A,S,M,D): ')

num1 = float(input('Enter first number: '))

num2 = float(input('Enter second number: '))


# In[12]:


print("Enter 'A' for Addition.")
print("Enter 'S' for Subtraction.")
print("Enter 'M' for Multiplication.")
print("Enter 'D' for Division.")

choice = input('Enter Choice: (A,S,M,D): ')



if choice.upper() in ('A','ADD','ADDITION','S','SUBTRACT','SUBTRACTION','M','MULTIPLY','MULTIPLICATION','D','DIVIDE','DIVISION'):
    num1 = float(input('Enter first number: '))
    num2 = float(input('Enter second number: '))
    
    if choice.upper() in ('A','ADD','ADDITION'):
        print('Result: ',num1, '+', num2, '=',add(num1,num2))
        
    elif choice.upper() in ('S','SUBTRACT','SUBTRACTION'):
        print('Result: ',num1, '-', num2, '=',subtract(num1,num2))
        
    elif choice.upper() in ('M','MULTIPLY','MULTIPLICATION'):
        print('Result: ',num1, '*', num2, '=',multiply(num1,num2))
        
    elif choice.upper() in ('D','DIVIDE','DIVISION'):
        print('Result: ',num1, '/', num2, '=',divide(num1,num2))
        
else:
    print("Please input a correct choice.")


# In[15]:


print("Enter 'A' for Addition.")
print("Enter 'S' for Subtraction.")
print("Enter 'M' for Multiplication.")
print("Enter 'D' for Division.")


while True:
    choice = input('Enter Choice: (A,S,M,D): ')
  
    if choice.upper() in ('A','ADD','ADDITION','S','SUBTRACT','SUBTRACTION','M','MULTIPLY','MULTIPLICATION','D','DIVIDE','DIVISION'):
        num1 = float(input('Enter first number: '))
        num2 = float(input('Enter second number: '))

        if choice.upper() in ('A','ADD','ADDITION'):
            print('Result: ',num1, '+', num2, '=',add(num1,num2))

        elif choice.upper() in ('S','SUBTRACT','SUBTRACTION'):
            print('Result: ',num1, '-', num2, '=',subtract(num1,num2))

        elif choice.upper() in ('M','MULTIPLY','MULTIPLICATION'):
            print('Result: ',num1, '*', num2, '=',multiply(num1,num2))

        elif choice.upper() in ('D','DIVIDE','DIVISION'):
            print('Result: ',num1, '/', num2, '=',divide(num1,num2))

    else:
        print("Please input a correct choice.")
        
    next_calculation = input("Want to do another calculation? (yes/no?): ")
    if next_calculation.lower() in ('no','n','nope'):
        break 


# In[ ]:




