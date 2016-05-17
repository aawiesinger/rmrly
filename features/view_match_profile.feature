Feature: Generate roommate matches
    As a user
    I want to click a button to generate matches
    So that I can see people that I am compatible with
  
    Background: The user has signed up to Rmrly
      Given A user exists with email "123@binghamton.edu" and password "pass1234" and name "user1"
      And the user with the name "user1" likes to go to bed "early"
      And the user with the name "user1" likes to wake up "early"
      And the user with the name "user1" likes to smoke
      And the user with the name "user1" likes to drink
      And the user with the name "user1" likes to party
      And the user with the name "user1" likes to listen to loud music
      And the user with the name "user1" is "clean"
      And A user exists with email "234@binghamton.edu" and password "pass1234" and name "user2"
      And the user with the name "user2" likes to go to bed "early"
      And the user with the name "user2" likes to wake up "early"
      And the user with the name "user2" likes to smoke
      And the user with the name "user2" likes to drink
      And the user with the name "user2" likes to party
      And the user with the name "user2" likes to listen to loud music
      And the user with the name "user2" is "clean"
  
    Scenario: A new user generates matches and wants to view a match's profile
      Given I am on the matches page for the user with the name "user1"
      When I press "Generate matches!"
      And I follow View Profile
      Then I should be on the homepage for the user with the name "user2"
      
          