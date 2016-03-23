#Given /^(?:|I )am on (.+)$/ do |page_name|
#  visit path_to(page_name)
#end

Given /^I am on "([^"]*)"$/ do |path|
  visit path
end

Given /^(?:|I )am a user with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  #create account with email, password
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
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