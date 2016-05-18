require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #create" do
    before :each do
      @right_email = 'ABC@binghamton.edu'
      @wrong_email = 'fjdklsajfds@binghamton.edu'
      @right_password = '1234567'
      @wrong_password = '7654321'
      @userid = 66
      @user = FactoryGirl.create(:user, email: @right_email, password: @right_password, id: @userid)
    end
    describe "if the user exists" do
      it "should log in the user" do
        post :create, session: {email: @right_email, password: @right_password}
        expect(response).to redirect_to(user_path(@user))
      end
    end
    describe "if the user does not exist, or the wrong credentials were input" do
      it "should show the invalid credentials message" do
        post :create, session: {email: @wrong_email, password: @wrong_password}
        expect(flash[:danger]).to eq("Invalid email/password combination")
      end
      it "should render the 'new' page" do
        post :create, session: {email: @wrong_email, password: @wrong_password}
        expect(response).to render_template('new')
      end
    end
  end
end
