Feature: log in to Rmrly

    As a user with an account
	I want to see a login page for Rmrly
    So that I can login with my credentials and use the app

    Background: the user has signed up to use Rmrly
        
        Given I am a user with email "email123@binghamton.edu" and password "password123"
	    And I am on the login page

    Scenario: a returning user wants to log in
  
        When I fill in "Email" with "email123@binghamton.edu"
        And I fill in "Password" with "password123"
        And I press "Login"
        Then I should be on the homepage


	    