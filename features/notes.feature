Feature: Record temporary roommate notes on Rmrly 
  
    As a user who is browsing Rmrly
    I want to be able to input notes on potential roommates and have them persist throughout my session
    So that I can remember who I want to investigate for a roommate
    
    Background: the user enters their information
        
        Given I am on the notes page
        When I fill in "comments" with "Thinking about living with Annika Wiesinger, she seems cool."
        
    Scenario: A user visits the survey page
        When I press "Submit"
        Then I should see "Thinking about living with Annika Wiesinger, she seems cool."
        
        