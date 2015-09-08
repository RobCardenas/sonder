class SessionsController < ApplicationController
  
	# Login Form
  def new
    if current_user
      redirect_to profile_path
    else
      render :new
    end
  end

  # Authentica User
  def create
    user = User.find_by_email(user_params[:email])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to profile_path
    else 
      flash[:error] = "Incorrect email or password. Try again."
      redirect_to login_path
    end
  end

  # Clear Session (Destroy)
  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

end
