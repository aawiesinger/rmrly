require 'rails_helper'

RSpec.describe Message, type: :model do
    describe '#find_messages_between_users' do
        before :each do
                @fake_user1 = double(id: '1', username: 'user1')
                @fake_user2 = double(id: '2', username: 'user2')
                @fake_user3 = double(id: '3', username: 'user3')
              @fake_message1 = double(to_user: "user1", from_user: "user2", body: "hey", created_at: '01-01-2000')
              @fake_message2 = double(to_user: "user2", from_user: "user1", body: "whats up", created_at: '01-02-2000')
              @fake_message3 = double(to_user: "user1", from_user: "user2", body: "hello", created_at: '01-03-2000')
          end
        it 'should find messages between two users' do
            
        end
      end
end
