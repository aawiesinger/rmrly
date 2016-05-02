class MessagesController < ApplicationController
   
   def chat
      @messages = Message.find_messages_between_users(User.find_by_id(params[:user1]).name,User.find_by_id(params[:user2]).name)
      .order(:created_at) 
   end
end