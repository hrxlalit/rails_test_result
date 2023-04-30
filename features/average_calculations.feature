Feature: Average Calculation
  As a user
  I want to be able to calculate the average of results
  So I can get an accurate result 

Scenario: Calculate Average of results based on week
  Given a set of results
  When I run the daily task
  Then a result should be created for each subject

Scenario: Calculate Average of results based on monthly
  Given a set of results
  When I run the weekly task
  Then a result should be created for each subject with the average of daily low and high