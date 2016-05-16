Feature: Generate roommate matches
    As a user
    I want to click a button to generate matches
    So that I can see people that I am compatible with
  
    Background: The user has signed up to Rmrly
      Given A user exists with email "123@binghamton.edu" and password "pass1234" and name "testuser1"
      And the user with the name "testuser1" likes to go to bed "early"
      And the user with the name "testuser1" likes to wake up "early"
      And the user with the name "testuser1" likes to smoke
      And the user with the name "testuser1" likes to drink
      And the user with the name "testuser1" likes to party
      And the user with the name "testuser1" likes to listen to loud music
      And the user with the name "testuser1" is "clean"
      And A user exists with email "234@binghamton.edu" and password "pass1234" and name "testuser2"
      And the user with the name "testuser2" likes to go to bed "early"
      And the user with the name "testuser2" likes to wake up "early"
      And the user with the name "testuser2" likes to smoke
      And the user with the name "testuser2" likes to drink
      And the user with the name "testuser2" likes to party
      And the user with the name "testuser2" likes to listen to loud music
      And the user with the name "testuser2" is "clean"
      And A user exists with email "345@binghamton.edu" and password "pass1234" and name "testuser3"
      And the user with the name "testuser3" likes to go to bed "late"
      And the user with the name "testuser3" likes to wake up "early"
      And the user with the name "testuser3" does not smoke
      And the user with the name "testuser3" likes to drink
      And the user with the name "testuser3" likes to party
      And the user with the name "testuser3" likes to listen to loud music
      And the user with the name "testuser3" is "clean"
  
    Scenario: A new user generates matches and has matches
      Given I am on the matches page for the user with the name "testuser1"
      When I press "Generate matches!"
      Then I should be on the matches page for the user with the name "testuser1"
      Then I should see "testuser2"
      And I should not see "testuser3"
      And I should not see "testuser1"
          
    Scenario: A new user generates matches and does not have any matches
      Given I am on the matches page for the user with the name "testuser3" 
      When I press "Generate matches!"
      Then I should see "Looks like you don't have any matches yet :( Try generating some!"
      And I should not see "testuser1"
      And I should not see "testuser2"