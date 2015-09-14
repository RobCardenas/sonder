class UsersController < ApplicationController
  before_filter :authorize, only: [:show]

  def new
  	if current_user
  		redirect_to profile_path
  	else
  		@user = User.new
  		render :new
  	end
  end

  def create
  	if current_user
  		redirect_to profile_path
  	else
	  	user = User.new(user_params)
	  	if user.save
	  		session[:user_id] = user.id
	  		redirect_to profile_path
	  	else
        flash[:error] = user.errors.full_messages.join(', ')
	  		redirect_to signup_path
	  	end
  	end
  end

  def edit
  	@user = User.find(params[:id])
  	render :edit
  end

  def update
  	user = User.find(params[:id])
    # CJ: nice check for `current_user` here -- use the same logic
    # in your `edit` action as well
  	if user == current_user
  		user.update_attributes(user_params)
  		redirect_to profile_path
  	else
  		session[:user_id] = nil
  		redirect_to login_path
  	end
  end

  def show
    # CJ: you can just use `@user = current_user` here
    @user = User.find(session[:user_id])
  	render :show
  end

  private 
  	def user_params
  		params.require(:user).permit(:email, :full_name, :username, :password, :avatar)
  	end
end
