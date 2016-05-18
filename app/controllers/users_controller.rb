class UsersController < ApplicationController
   def view_matches
      @logged_in_user = User.find(params[:logged_in_user])
      @matches = Array.new
      if @logged_in_user.matches then @logged_in_user.matches.each {
          |user| 
          if @logged_in_user.name != user
            @matches.push(User.find_by_name(user))
          end
          } 
      end
   end
   
   def generate_matches
      @logged_in_user = User.find(params[:logged_in_user])
      new_matches = User.where(go_to_bed: @logged_in_user.go_to_bed, wake_up: @logged_in_user.wake_up,
                                smoke: @logged_in_user.smoke, drink: @logged_in_user.drink,
                                party: @logged_in_user.party, loud_music: @logged_in_user.loud_music,
                                messy_or_clean: @logged_in_user.messy_or_clean).map{ |user| user.name}.to_a
      my_name = @logged_in_user.name
      new_matches.delete(my_name)
      User.update(@logged_in_user, matches: new_matches)
      redirect_to view_matches_path(@logged_in_user)
   end
   
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      log_in @user
      flash[:success] = "Welcome to rmrly!"
      #redirect_to @user
      redirect_to survey_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def survey
    @user = User.find(params[:user1])
  end
  
  def send_survey
    @user = User.find(params[:user1])
    
    # missing_fields = ""
    # if(params[:go_to_bed].empty?)
    #   missing_fields += "Enter an answer for Do you go to bed early, or late?\n"
    # end
    # if (params[:wake_up].empty?)
    #   missing_fields += "Enter an answer for Do you wake up early, or late?\n"
    # end
    # if(params[:smoke].empty?)
    #   missing_fields += "Select an answer for Do you smoke?\n"
    # end
    # if(params[:drink].empty?)
    #   missing_fields += "Select an answer for Do you drink?\n"
    # end    
    # if(params[:party].empty?)
    #   missing_fields += "Select an answer for Do you party?\n"
    # end
    # if(params[:loud_music].empty?)
    #   missing_fields += "Select an answer for Do you listen to loud music?\n"
    # end
    # if(params[:messy_or_clean].empty?)
    #   missing_fields += "Enter an answer for Are you messy or clean?\n"
    # end    
    
    # if missing_fields != ""
    #   flash[:notice] = missing_fields
    #   redirect_to survey_path(@user)
    # else
      @user.go_to_bed = params[:go_to_bed]
      @user.wake_up = params[:wake_up]
      @user.smoke = params[:smoke]
      @user.drink = params[:drink]
      @user.party = params[:party]
      @user.loud_music = params[:loud_music]
      @user.messy_or_clean = params[:messy_or_clean]
    #end
      
      if @user.save
        # Handle a successful save.
        flash[:success] = "Answers sent successfully!"
        #redirect_to @user
        #redirect_to user_path(@user)
        redirect_to @user
      else
        flash[:notice] = "Could not save answers"
        redirect_to survey_path(@user)
      end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,:go_to_bed, :wake_up,
                                   :smoke, :drink, :party, :loud_music,
                                   :messy_or_clean)
    end
    
    def logged_in_user 
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
