require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  
  describe '#generate_matches' do
    before :each do
      @id1 = 33
      @id2 = 44
      @id3 = 55
      @id4 = 66
      @name1 = "abc1"
      @name2 = "abc2"
      @name3 = "abc3"
      @name4 = "abc4"
      @email1 = 'abc1@gmail.com'
      @email2 = 'abc2@gmail.com'
      @email3 = 'abc3@gmail.com'
      @email4 = 'abc4@gmail.com'
      @user1 = FactoryGirl.create(:user, name: @name1, id: @id1, email: @email1, 
                                go_to_bed: "early", wake_up: "early",
                                smoke: false, drink: true,
                                party: true, loud_music: true,
                                messy_or_clean: "clean")
      @user2 = FactoryGirl.create(:user, name: @name2, id: @id2, email: @email2, 
                                go_to_bed: "early", wake_up: "early",
                                smoke: false, drink: true,
                                party: true, loud_music: true,
                                messy_or_clean: "clean")
      @user3 = FactoryGirl.create(:user, name: @name3, id: @id3, email: @email3, 
                                go_to_bed: "late", wake_up: "early",
                                smoke: true, drink: true,
                                party: true, loud_music: false,
                                messy_or_clean: "clean")
      @user4 = FactoryGirl.create(:user, name: @name4, id: @id4, email: @email4, 
                                go_to_bed: "early", wake_up: "early",
                                smoke: false, drink: true,
                                party: true, loud_music: true,
                                messy_or_clean: "clean")
    end
   
    it 'should :generate_matches for the logged_in_user' do
          post :generate_matches, logged_in_user: @id1
          @user1.reload
          expect(@user1.matches).to contain_exactly(@user2.name, @user4.name)
          #post :generate_matches, logged_in_user: @id1
      end
    
  end
  
  describe '#view_matches' do
     before :each do
      @id1 = 33
      @id2 = 44
      @id3 = 55
      @id4 = 66
      @name1 = "abc1"
      @name2 = "abc2"
      @name3 = "abc3"
      @name4 = "abc4"
      @email1 = 'abc1@gmail.com'
      @email2 = 'abc2@gmail.com'
      @email3 = 'abc3@gmail.com'
      @email4 = 'abc4@gmail.com'
      @user1 = FactoryGirl.create(:user, name: @name1, id: @id1, matches: [], email: @email1)
      @user2 = FactoryGirl.create(:user, name: @name2, id: @id2, matches: [@name3, @name4], email: @email2)
      @user3 = FactoryGirl.create(:user, name: @name3, id: @id3, matches: [@name2], email: @email3)
      @user4 = FactoryGirl.create(:user, name: @name4, id: @id4, matches: [@name2], email: @email4)
    end
       it 'should render the :view_matches template' do
          get :view_matches, logged_in_user: @id1
          expect(response).to render_template("view_matches")
       end
       describe "if the user already has matches" do
        it "should find all the correct matches for this user" do
            get :view_matches, logged_in_user: @id2
            expect(assigns(:matches)).to contain_exactly(@user3, @user4)
          end
        end
        describe "if the user doesn't already have matches" do
          it "should not find any matches" do
            get :view_matches, logged_in_user: @id1
            expect(assigns(:matches)).to be_empty
        end
     end
   end

  describe "#send_survey" do
    before :each do
      @id1 = 33
      @name1 = "abc1"
      @email1 = 'abc1@gmail.com'
      @user1 = double(:user, name: @name1, id: @id1, email: @email1)
    end
    it "updates user info" do
      pending("send_survey cucumber test also not working - known bug")
      #fill_in 'go_to_bed', :with => 'early'
      post :send_survey, user: @user1
      expect(@user1.go_to_bed).to eq("early")
    end
  end
  
end
