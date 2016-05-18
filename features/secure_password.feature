Feature: Validate user has a secure password
  
    As a new user without an account
    So that only I can log in to my account in the future
    I want to use a secure password when I signup
        
    Scenario: A new user is unable to sign in without a secure password
        
        Given I am on the signup page
        When I fill in "Email" with "example@binghamton.edu"
        And I fill in "Password" with "bad"
        And I fill in "Name" with "user1"
        And I fill in "Confirmation" with "bad"
        And I press "Create my account"
        Then I should be on the users page
        And I should see "The form contains 1 error."
        And I should see "Password is too short (minimum is 6 characters)"