Feature: See a list of all the users that a user has matched with when they log in
  
    As a user who has already created a profile and generated matches
    I want to see a list of everyone I've matched with
    So I can see their profiles and chat with them
    
Background: I'm logged in and I am already matched with some other users
  
  Given the user with username "user1" and matches "user2, user3" and password "jfkdlsajklfds" and email "123@fdsaf.com" exists
  And the user with username "user2" and matches "user1" and password "jfkdlsajklfds" and email "fdsa@fdsa.fdsa" exists
  And the user with username "user3" and matches "user4, user5, user6, user1" and password "jfkdlsajklfds" and email "fdsfdsa@fdsan.fdsa" exists
  And the user with username "user4" and matches "user3, user6, user7" and password "jfkdlsajklfds" and email "fkjelwaj@fdjskal.fesda" exists
  And the user with username "user5" and matches "user3, user6" and password "jfkdlsajklfds" and email "fdsaj@fdnsjak.fesa" exists
  And the user with username "user6" and matches "user3, user5, user7, user4" and password "jfkdlsajklfds" and email "fejrwa@fdnsjak.edfs" exists
  And the user with username "user7" and matches "user4, user6" and password "jfkdlsajklfds" and email "fdsah@fdsh.fdsna" exists
  
Scenario: I just logged in as "user2", a user with 1 match
  When I go to the dashboard page logged in as "user2"
  Then I should see the welcome message for "user2"
  And I should see 1 user profile
  And I should see "user1"
  
Scenario: I just logged in as "user6", a user with 4 matches
  When I go to the dashboard page logged in as "user6"
  Then I should see the welcome message for "user6"
  And I should see 4 user profiles
  And I should see "user3" before "user5"
  And I should see "user5" before "user7"
  And I should see "user7" before "user4"
  