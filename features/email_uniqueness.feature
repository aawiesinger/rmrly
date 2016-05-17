Feature: Emails must be unique
    As a user
    I expect to be the only user with my email
    So that I may securely use Rmrly
    
    Background: A User exists with a particular email
        Given A user exists with email "123@binghamton.edu" and password "pass1234" and name "testuser1"
        
    Scenario: A new user attempts to signup with an existing email
        Given I am on the signup page
        And I fill in "Name" with "testuser2"
        And I fill in "Email" with "123@binghamton.edu"
        And I fill in "Password" with "pass1234"
        And I fill in "Confirmation" with "pass1234"
        And I press "Create my account"
        Then I should be on the users page
        And I should see "The form contains 1 error."
        And I should see "Email has already been taken"