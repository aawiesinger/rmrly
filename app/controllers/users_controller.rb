class UsersController < ApplicationController
  #luke testing
  #before_action :set_user, only: [:create, :show, :edit, :update, :destroy]
  def user_params
      params.require(:user).permit(:email, :password)
  end
  
  def signup #using create for now
    # @user = User.create!(user_params)
    # flash[:notice] = "#{@user.email} was successfully created."
    #@user = User.new

    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end
  
  def login
    #fix routes in routes.rb
    #get login info and find user in database then
    #wherever
  end
  
  def login_info
    @user = User.find(params[:email])
    
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
  end

  # GET /users/new
  def new

  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
     
    #@user = User.new(user_params)

    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
    
    @user = User.create!(user_params)
    flash[:notice] = "#{@user} was successfully created."
    redirect_to users_path #change to page Josh is making 
  end
  
  #/user/id/create_profile
  def create_profile
    
  end
  
  #/user/id/create_profile_post
  
  
  def create_profile_post
    # Using movie as an example
    # @movie = Movie.find params[:id]
    # @movie.update_attributes!(movie_params)
    # flash[:notice] = "#{@movie.title} was successfully updated."
    # redirect_to movie_path(@movie)
    
    @user = User.find params[:id]
    @user.#not update_attributes but add new ones: name, age
    
    
  end
  
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def user_params
    #   params.require(:user).permit(:email, :password)
    # end
end
