class MessagesController < ApplicationController
   
   def chat
      @this_user = User.find_by_id(params[:user1])
      @other_user =User.find_by_id(params[:user2])
      @messages = Message.find_messages_between_users(@this_user.name,@other_user.name)
      .order(:created_at)
      @incoming_messages = @messages.select{|m| m.to_user == @this_user.name}
      @outgoing_messages = @messages.select{|m| m.from_user == @this_user.name}
   end

   def send_message
      @this_user = User.find_by_id(params[:user1])
      @other_user =User.find_by_id(params[:user2])
      Message.create!(to_user: @other_user.name, from_user: @this_user.name, body: params[:message][:body])
      redirect_to chat_path(@this_user, @other_user)
   end

end