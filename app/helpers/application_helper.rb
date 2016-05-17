module ApplicationHelper
    def full_title(page_title)
        base_title = "rmrly"
        if page_title.empty?
            base_title
        else
            "#{base_title} | #{page_title}"
        end
    end
    
    def curr_user
        @curr_user ||= User.find(session[:user_id]) if session[:user_id]
    end   
 end
