Feature: Signup to Rmrly
  
    As a new user without an account
    So that I may use this site
    I want to see a signup page on Rmrly
    
    Scenario: A new user signs up for Rmrly
        
        Given I am on the signup page
        When I fill in "Email" with "example@binghamton.edu"
        And I fill in "Password" with "pass123"
        And I fill in "Name" with "user1"
        And I fill in "Confirmation" with "pass123"
        And I press "Create my account"
        #Then I should be on the homepage for the user with the name "user1"
        Then I should be on the survey page for the user with the name "user1"
        