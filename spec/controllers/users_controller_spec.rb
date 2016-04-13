require 'rails_helper'

describe UsersController do
  describe "#create" do
    before :each do
      @email = "mail@binghamton.edu"
      @password = "password123"
    end
    it "creates a new user" do
      post :create, :user => {:email => @email, :password => @password}
      expect(assigns(:user)).not_to be_nil
    end
  end
end