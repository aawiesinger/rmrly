Feature: Signup to Rmrly
  
    As a new user without an account
    So that I may use this site
    I want to see a signup page on Rmrly
    
    Scenario: A new user signs up for Rmrly
        
        Given I am on the signup page
        When I fill in "Email" with "example@binghamton.edu"
        And I fill in "Password" with "pass123"
        And I click "Sign Up"
        Then I should be on the homepage
  