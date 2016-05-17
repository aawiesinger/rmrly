Feature: Validate a user has all required information to sign up
    As a user
    I want to provide my name, a valid email and password
    So that I can sign up for Rmrly
    
    # Scenario: A user is validated during signup
    #     Given I am on the signup page
    #     When I fill in "Email" with "example@binghamton.edu"
    #     And I fill in "Password" with "pass123"
    #     And I fill in "Name" with "user1"
    #     And I fill in "Confirmation" with "pass123"
    #     And I press "Create my account"
    #     Then I should be on the survey page for the user with the name "user1"
        
    Scenario: A user is not validated during signup
        Given I am on the signup page
        When I fill in "Email" with "example@binghamton.edu"
        And I fill in "Password" with "pass123"
        And I fill in "Confirmation" with "pass123"
        And I press "Create my account"
        Then I should be on the users page
        And I should see "The form contains 1 error."
        And I should see "Name can't be blank"