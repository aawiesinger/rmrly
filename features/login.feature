Feature: log in to Rmrly

    As a user with an account
	I want to see a login page for Rmrly
    So that I can login with my credentials and use the app

    Background: the user has signed up to use Rmrly
        
        Given A user exists with email "123@binghamton.edu" and password "pass1234" and name "user1"
	    And I am on the login page

    Scenario: user sees the login prompt
  
        When I fill in "Email" with "123@binghamton.edu"
        And I fill in "Password" with "pass1234"
        And I press "Log in"
        Then I should be on the homepage for the user with the name "user1"


	    