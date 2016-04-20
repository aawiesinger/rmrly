class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
                    #vvv need to implement this still
    if user && user.authenticate(params[:session][:password])
      #log in the user
    else
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end
  
  def destroy
  end
end
