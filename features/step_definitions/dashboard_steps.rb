Given /the user with username "(.+)" and matches "(.+)" exists/ do |username, matches|
    m = matches.split(", ")
  User.create(name: username, matches: m)
end

Then /^I should see the welcome message for "(.+)"$/ do |user|
    expect(page).to have_content("Welcome to Rmrly, #{user}!")
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
   expect(page).to have_content(text)
end

Then /I should see ([\d]+) user profile(?:s)?/ do |num|
  expect(page).to have_selector("table tr", count: (num.to_i))
end