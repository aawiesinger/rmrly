Feature: View survey page answers for Rmrly
  
    As a user who has just signed up for Rmrly
    I want to be able to fill out a survey that saves my preferences about roommates
    So that I can use Rmrly to find a roommate
    
    Background: the user enters their information
        Given I am on the signup page
        When I fill in "Email" with "example@binghamton.edu"
        And I fill in "Password" with "pass123"
        And I fill in "Name" with "user1"
        And I fill in "Confirmation" with "pass123"
        And I press "Create my account"
        Then I should be on the survey page for the user with the name "user1"
        
    Scenario: A user doesn't answer all questions
        When I fill in "wake_up" with "early"
        And I press "Save"
        Then I should be on the survey page for the user with the name "user1"
        And I should see "Select an answer for Enter an answer for Do you go to bed early, or late?"    
        
    Scenario: A user visits the survey page
        When I fill in "go_to_bed" with "early"
        And I fill in "wake_up" with "early"
        And I select "smoke-yes"
        And I select "drink-yes"
        And I select "party-yes"
        And I select "loud-music-yes"
        And I fill in "messy_or_clean" with "messy"
        And I press "Save"
        Then I should be on the homepage for the user with the name "user1"
        And I should see "I like to go to bed early"
        And I should see "I enjoy waking up early"
        And I should see "I smoke"
        And I should see "I drink"
        And I should see "I party"
        And I should see "I listen to loud music"
        And I should see "I'm really messy"