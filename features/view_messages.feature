Feature: See messages exchanged by two users in chronological order
  
  As a user who has matched with other users
  I want to view messages I've sent to and received from other users in chronological order
  So that I can have conversations with other users
  
Background: You're logged in as "user1" and there are messages in the database
  
  Given the following messages exist:
    | to_user   | from_user | body      |
    | user1     | user2     | hey       |
    | user2     | user1     | hi        |
    | user1     | user2     | wanna be roommates |
    | user2     | user1     | sure      |
    | user2     | user1     | lets do it|
    
    And the user with the username "user1" exists
    And the user with the username "user2" exists
    
Scenario: I should see the messages in chronological order
  When I go to the conversation page between "user1" and "user2"
  Then I should see "hey" before "hi"
  And I should see "hi" before "wanna be roommates"
  And I should see "wanna be roommates" before "sure"
  And I should see "sure" before "lets do it"