class ApplicationController < ActionController::Base
  
  before_action :require_login

  helper_method :current_user

  def current_user
    # If session[:user_id] is nil, set it to nil, otherwise find the user by id.
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  private 

  def require_login
    unless current_user
      flash[:alert] = "You must be logged in to access this section"
      redirect_to new_user_session_path
    end
  end

end
