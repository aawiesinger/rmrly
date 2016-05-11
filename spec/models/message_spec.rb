require 'rails_helper'

RSpec.describe Message, type: :model do
    fixtures :messages, :users
    describe '#find_messages_between_users' do
        before :each do
            @messages = Message.find_messages_between_users(users(:fake_user1).username, users(:fake_user2).username) 
        end
        it 'should find messages between two users' do
            expect(@messages).to include(messages(:fake_message1), messages(:fake_message2))
        end
        it 'should not find messages from or to other users' do
           expect(@messages).not_to include(messages(:fake_message3), messages(:fake_message4)) 
        end
      end
end
