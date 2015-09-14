class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # CJ: creative way to solve this!
  before_filter :disable_footer, only: [:landing, :new, :edit]

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
  	unless current_user
  		redirect_to login_path
  	end
  end

  def disable_footer
    @disable_footer = true
  end

end
