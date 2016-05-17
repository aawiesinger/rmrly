Feature: Email validation
    As a user
    I expect to only be able to sign up if I provide a valid email
    So that I can prove who I am when I log in
    
    Scenario: A users email is not validated during signup
        Given I am on the signup page
        And I fill in "Name" with "user1"
        And I fill in "Email" with "bademail.com"
        And I fill in "Password" with "pass123"
        And I fill in "Confirmation" with "pass123"
        And I press "Create my account"
        Then I should be on the users page
        And I should see "The form contains 1 error."
        And I should see "Email is invalid"