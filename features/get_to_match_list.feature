Feature: Get to the list of matches from the front page
  
  As a user
  I want to get to the match list from the front page of the website
  Since that is how I access can access the website
  
  
Scenario: I log in as a user who already has some matches
  Given the user with username "user1" and matches "user2, user3" and password "jfkdlsajklfds" and email "123@fdsaf.com" exists
  And the user with username "user2" and matches "user1" and password "jfkdlsajklfds" and email "123324@fdsaf.com" exists
  And the user with username "user3" and matches "user1" and password "jfkdlsajklfds" and email "redfsa123324@fdsaf.com" exists
  And I am on the login page
   When I fill in "Email" with "123@fdsaf.com"
  And I fill in "Password" with "jfkdlsajklfds"
  And I press "Log in"
  And I follow Matches
  Then I should be on the dashboard page logged in as "user1"
  And I should see 2 user profiles
  And I should see "user2" before "user3"
  
Scenario: I just created an account so I have no matches
    Given I am on the signup page
    When I fill in "Email" with "example@binghamton.edu"
    And I fill in "Password" with "pass123"
    And I fill in "Name" with "user4"
    And I fill in "Confirmation" with "pass123"
    And I press "Create my account"
    And I fill in "go_to_bed" with "early"
    And I fill in "wake_up" with "early"
    And I select "smoke-yes"
    And I select "drink-yes"
    And I select "party-yes"
    And I select "loud-music-yes"
    And I fill in "messy_or_clean" with "messy"
    And I press "Save"    
    And I follow Matches
    Then I should be on the dashboard page logged in as "user4"
    And I should see "Looks like you don't have any matches yet :( Try generating some!"
  