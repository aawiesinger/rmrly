#Given /^(?:|I )am on (.+)$/ do |page_name|
#  visit path_to(page_name)
#end

Given /^I am on (.+)$/ do |path|
  visit path_to(path)
end

Given /^A user exists with email "([^"]*)" and password "([^"]*)" and name "([^"]*)"$/ do |email, password, name|
  User.create(email: email, password: password, name:name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )select "([^"]*)"$/ do |radio_button|
  choose(radio_button)
end

When /^I follow (.+)$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

#Then /^Ishould see "([^"]*)" in the selector "([^"]*)"$/ do |text, selector|
#  page.should have_selector selector, content: text
#end
# 
#Then /^I should see "([^"]*)" in a link$/ do |text|
#  page.should have_link text
#end

Then /^I should see "([^"]*)"$/ do |text|
    page.should have_content text
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.should have_no_content text
end

# Stuff for generating matches

Given(/^the user with the name "([^"]*)" likes to go to bed "([^"]*)"$/) do |arg1, arg2|
  #pending # Write code here that turns the phrase above into concrete actions
  @user = User.find_by_name(arg1)
  @user.go_to_bed = arg2
end

Given(/^the user with the name "([^"]*)" likes to wake up "([^"]*)"$/) do |arg1, arg2|
  #pending # Write code here that turns the phrase above into concrete actions
  @user = User.find_by_name(arg1)
  @user.wake_up = arg2
end

Given(/^the user with the name "([^"]*)" likes to smoke$/) do |arg1|
  #pending # Write code here that turns the phrase above into concrete actions
  @user = User.find_by_name(arg1)
  @user.smoke = true
end

Given(/^the user with the name "([^"]*)" does not smoke$/) do |arg1|
  #pending # Write code here that turns the phrase above into concrete actions
  @user = User.find_by_name(arg1)
  @user.smoke = false
end

Given(/^the user with the name "([^"]*)" likes to drink$/) do |arg1|
  #pending # Write code here that turns the phrase above into concrete actions
  @user = User.find_by_name(arg1)
  @user.drink = true
end

Given(/^the user with the name "([^"]*)" likes to party$/) do |arg1|
  #pending # Write code here that turns the phrase above into concrete actions
  @user = User.find_by_name(arg1)
  @user.party = true
end

Given(/^the user with the name "([^"]*)" likes to listen to loud music$/) do |arg1|
  #pending # Write code here that turns the phrase above into concrete actions
  @user = User.find_by_name(arg1)
  @user.loud_music = true
end

Given(/^the user with the name "([^"]*)" is "([^"]*)"$/) do |arg1, arg2|
  #pending # Write code here that turns the phrase above into concrete actions
  @user = User.find_by_name(arg1)
  @user.messy_or_clean = arg2
end