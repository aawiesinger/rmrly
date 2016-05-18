require 'rails_helper'
require 'spec_helper'
require 'messages_controller'

describe MessagesController, type: :controller do
    before :each do
       @user_id_1 = 21
       @user_id_2 = 22
       @user_id_3 = 23
       @email1 = 'gfdsgfdsgfds@hgfhgfdhgfd.com'
       @email2 = 'fdsagfdshgfdh@gfhgfdhgfd.com'
       @email3 = 'fdsagfdsgfds@fdsakfdksa.com'
       @user_name_1 = "john doe"
       @user_name_2 = "jane doe"
       @user_name_3 = "james doe"
       @user1 = FactoryGirl.create(:user, email: @email1, name: @user_name_1, id: @user_id_1)
       @user2 = FactoryGirl.create(:user, email: @email2, name: @user_name_2, id: @user_id_2)
       @user3 = FactoryGirl.create(:user, email: @email3, name: @user_name_3, id: @user_id_3)
       @message_body_1 = "hello there"
       @message_body_2 = "hey hi hello"
       @message1 = FactoryGirl.create(:message, to_user: @user_name_1, from_user: @user_name_2, body: @message_body_1)
       @message2 = FactoryGirl.create(:message, to_user: @user_name_2, from_user: @user_name_1, body: @message_body_2)
    end
    describe '#chat' do
        describe "when 2 users haven't exchanged messages yet" do
            it 'should not find any messages' do
                expect(Message).to receive(:find_messages_between_users){Message.none}
                get :chat, user1: @user_id_1, user2: @user_id_3
            end
        end
        describe 'when 2 users have exchanged messages' do
            it "should find the messages they've exchanged" do
                get :chat, user1: @user_id_1, user2: @user_id_2
                expect(assigns(:messages)).to contain_exactly(@message1, @message2)
            end
            it "should find which messages are incoming and which are outgoing" do
                get :chat, user1: @user_id_1, user2: @user_id_2
                expect(assigns(:incoming_messages)).to contain_exactly(@message1)
                expect(assigns(:outgoing_messages)).to contain_exactly(@message2)
            end
        end
        it "should render the chat template" do
            get :chat, user1: @user_id_1, user2: @user_id_2
            expect(response).to render_template("chat")
        end
    end
end