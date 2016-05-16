module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  
  def path_to(page_name)
    case page_name
    when /^the home\s?page for the user with the name "([^"]*)"$/
      user_path(User.find_by_name($1))
    when /^the sign\s?up page$/
      '/signup' #signup_path
    when /^the log\s?in page$/
      login_path
    when /^the home\s?page$/
      root_path
    when /^the help\s?page$/
      help_path
    when /^the about\s?page$/
      about_path
    when /^the contact\s?page$/
      contact_path
    when /^the survey\s?page for the user with the name "([^"]*)"$/
      survey_path(user1: User.find_by_name($1))
      
    when /^the edit page for the user with the name "([^"]*)"$/
      edit_user_path(User.find_by_name($1))
      
    when /^the matches page for the user with the name "([^"]*)"$/
      view_matches_path(User.find_by_name($1))
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
      
    when /^the conversation page between "([^"]*)" and "([^"]*)"/
        chat_path(user1: User.find_by_name($1), user2: User.find_by_name($2))
        
    when /^the dashboard page logged in as "([^"]*)"$/
      view_matches_path(logged_in_user: User.find_by_name($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
