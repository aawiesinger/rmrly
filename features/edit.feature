Feature: Edit page for Rmrly
   
    As a user with a profile page
    I want to be able to edit information on my profile
    
    Background: the user has signed up to use Rmrly
        Given A user exists with email "123@binghamton.edu" and password "pass1234" and name "user1"
        And I am on the login page

    
    Scenario: A returning user with a profile wants to edit information
        When I fill in "Email" with "123@binghamton.edu"
        And I fill in "Password" with "pass1234"
        And I press "Log in"
        And I follow Settings
        And I fill in "Name" with "user1_changed"
        And I press "Save changes"
        Then I should see "user1_changed"