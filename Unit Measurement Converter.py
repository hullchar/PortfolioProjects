#!/usr/bin/env python
# coding: utf-8

# In[ ]:


# Unit of Measure Converter created with the guidance from Analyst Builder by Alex Freberg
# Highlights the use of Python in Jupyter notebook and aspects of data types, operators, and statements

convert_from = input("Enter starting unit of Measurement(inches, feet, yards): ")

convert_to = input("Enter unit of Measurement to Convert to(inches, feet, yards): ")

if convert_from.lower() in ["inches", "in", "inch"]:
    number_of_inches = int(input("Enter starting measurement in Inches: "))
    if convert_to.lower() in ["feet", "foot", "ft"]:
        print("Result: " + str(number_of_inches) + " Inches = " + str(round(number_of_inches / 12,2)) + " Feet")
    elif convert_to.lower() in ["yards", "yd", "yard", "yds"]:
        print("Result: " + str(number_of_inches) + " Inches = " + str(round(number_of_inches / 36,2)) + " Yards")
    else: 
        print("Please enter either Inches, Feet, or Yards.")
elif convert_from.lower() in ["feet", "foot", "ft"]:
    number_of_feet = int(input("Enter starting measurement in Feet: "))
    if convert_to.lower() in ["inches", "in", "inch"]:
        print("Result: " + str(number_of_feet) + " Feet = " + str(round(number_of_feet * 12)) + " Inches")
    elif convert_to.lower() in ["yards", "yd", "yard", "yds"]:
        print("Result: " + str(number_of_feet) + " Feet = " + str(round(number_of_feet / 3,2)) + " Yards")
    else: 
        print("Please enter either Inches, Feet, or Yards.")
elif convert_from.lower() in ["yards", "yd", "yard", "yds"]:
    number_of_yards = int(input("Enter starting measurement in Yards: "))
    if convert_to.lower() in ["inches", "in", "inch"]:
        print("Result: " + str(number_of_yards) + " Yards = " + str(round(number_of_yards * 36)) + " Inches")
    elif convert_to.lower() in ["feet", "foot", "ft"]:
        print("Result: " + str(number_of_yards) + " Yards = " + str(round(number_of_yards *3)) + " Feet")
    else: 
        print("Please enter either Inches, Feet, or Yards.")
else: 
    print("Please enter either Inches, Feet, or Yards.")


# In[ ]:




