Feature: Edit survey answers
   
    As a user with a profile page
    I want to be able to edit my original answers to the survey
    
    Background: the user has signed up to use Rmrly
        Given A user exists with email "123@binghamton.edu" and password "pass1234" and name "user1"
        And the user with the name "user1" does not smoke
        And the user with the name "user1" likes to drink
        And I am on the login page
        And I fill in "Email" with "123@binghamton.edu"
        And I fill in "Password" with "pass1234"
        And I press "Log in"
        
    Scenario: A returning user with a profile wants to edit information
        When I follow Settings
        And I select "smoke-yes"
        And I select "drink-no"
        And I press "Save changes"
        Then I should see "I smoke"
        And I should see "I don't drink"