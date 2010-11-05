class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def logged_in?
    session[:user_id]
  end
  helper_method :logged_in?
  
  def current_user
    if !@headless && session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  helper_method :current_user
  
  def permission_denied
    flash[:error] = "Du besitzt nicht die erforderlichen Rechte um diese Seite zu sehen."
    redirect_to root_path
  end
  
end
