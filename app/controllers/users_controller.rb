class UsersController < ApplicationController
   def dashboard
      @logged_in_user = User.find(params[:logged_in_user])
      @matches = Array.new
      @logged_in_user.matches.each {|user| @matches.push(User.find_by_username(user))}
      return @matches
   end
end