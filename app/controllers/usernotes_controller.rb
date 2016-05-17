class UsernotesController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
  def index
    print(session[:comments])
  end
  
  skip_before_filter :verify_authenticity_token
  def save
    existing = session[:comments]
    session[:comments] = String(existing) + "\n" + params[:comments]
    
    print(session[:comments])
    redirect_to action: "index"
  end
end
