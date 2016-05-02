When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /the following messages exist/ do |messages_table|
  Message.create(messages_table.hashes)
end

Given /the user with the username "(.*)" exists/ do |user|
    User.create(name: user)
end

Then /^I should see "(.*)" before "(.*)"$/ do |e1, e2|
  expect(page.body).to match(/.*#{e1}.*#{e2}.*/m)
end