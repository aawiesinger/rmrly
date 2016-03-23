class Message < ActiveRecord::Base
    def self.find_messages_between_users(user1,user2)
        Message.where("(to_user = ? and from_user = ?) or (to_user = ? and from_user = ?)", user1, user2, user2, user1)
    end
end
