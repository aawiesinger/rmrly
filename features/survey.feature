Feature: View survey page for Rmrly
  
    As a user who has just signed up for Rmrly
    I want to be able to fill out a survey that saves my preferences about roommates
    So that I can use Rmrly to find a roommate
    
    Background: the user enters their information
        
        Given I am on the signup page
        When I fill in "Email" with "example@binghamton.edu"
        And I fill in "Password" with "pass123"
        And I fill in "Name" with "user1"
        And I fill in "Confirmation" with "pass123"
        
    Scenario: A user visits the survey page
        
        When I press "Create my account"
        Then I should be on the survey page for the user with the name "user1"
        And I should see "Welcome to Rmrly! Please complete the survey below to enhance your profile:"
        