require 'rails_helper'
require 'users_controller'

describe UsersController, type: :controller do
    describe '#dashboard' do
       it 'should render the :dashboard template' do
          id = 8
          FactoryGirl.create(:user, username: "fake_user", id: id, matches: [])
          get :dashboard, logged_in_user: id
          expect(response).to render_template("dashboard")
       end
    end
end