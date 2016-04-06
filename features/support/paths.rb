module NavigationHelpers
  def path_to(page_name)
    case page_name
      
    when /^the conversation page between "([^"]*)" and "([^"]*)"/
        chat_path(user1: User.find_by_username($1), user2: User.find_by_username($2))
        
    when /^the dashboard page logged in as "([^"]*)"$/
      dashboard_path(logged_in_user: User.find_by_username($1))

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
