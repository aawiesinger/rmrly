Given /the user with username "(.+)" and matches "(.+)" and password "(.+)" and email "(.+)" exists/ do |username, matches, password, email|
    m = matches.split(", ")
  User.create!(name: username, matches: m, password: password, email: email)
end

Then /^I should see the welcome message for "(.+)"$/ do |user|
    expect(page).to have_content("Here are all the other users you've matched with, #{user}:")
end

Then /I should see ([\d]+) user profile(?:s)?/ do |num|
  expect(page).to have_selector("table tr", count: (num.to_i + 1))
end