Feature: See messages exchanged by two users
  
  As a user
  I want to see messages I've sent to and received from another user
  So that we can have a conversation
  
Background: You're logged in as "user1" and there are messages in the database
  
  Given the following messages exist:
    | to_user   | from_user | body      |
    | user1     | user2     | hey       |
    | user2     | user1     | hi        |
    | user3     | user1     | whats up  |
    | user1     | user2     | wanna be roommates |
    | user2     | user1     | sure      |
    | user1     | user3     | yo        |
    | user2     | user1     | lets do it|

Scenario: I should see my messages on the right
  Given I am logged in as "user1"
  When I go to the conversation page with "user2"
  Then I should see "hi" to the right of "hey"
  
Scenario: I should see the messages in chronological order
  Given I am logged in as "user1"
  When I go to the conversation page with "user2"
  Then I should see "hey" before "hi"
  And I should see "hi" before "wanna be roommates"
  And I should see "wanna be roommates" before "sure"
  And I should see "sure" before "lets do it"
  
Scenario: I should not see messages to or from another user
  Given I am logged in as "user1"
  When I go to the conversation page with "user2"
  Then I should not see "whats up"
  And I should not see "yo"