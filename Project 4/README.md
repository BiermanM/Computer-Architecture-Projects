# Project 4 Instructions - BMI Calculator

## Objective
* The purpose of this assignment is to practice MIPS programming with arithmetic operations

## Detail
* Write a MIPS program that calculates BMI
* Use the following C++ code as pseudocode
* The variable `BMI` can be single or double precision

## C++ Code
```
#include <iostream>
#include <string>

int main()
{
  int height = 0, weight = 0;
  double bmi;
  string name;
  
  // Prompt user for their data
  cout << "What is your name?";
  cin >> name;
  
  cout << "Please enter your height in inches: ";
  cin >> height;
  cout << "Now enter your weight in pounds (round to a whole number): ";
  cin >> weight;
  
  // Calculate the BMI
  weight *= 703;
  height *= height;
  bmi = static_cast<double>(weight) / height;
  
  // Output the results
  cout << name << ", your BMI is: " << bmi << endl;
  
  if (bmi < 18.5)
    cout << "This is considered underweight. \n";
  else if (bmi < 25)
    cout << "This is normal weight. \n";
  else if (bmi < 30)
    cout << "This is considered overweight. \n";
  else
    cout << "This is considered obese. \n";
  
  return 0;
}
```
