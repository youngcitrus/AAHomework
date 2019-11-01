class ApplicationController < ActionController::Base

  helper_method :logged_in?, :redirect_if_not_logged_in, :login, :logout, :current_user

  def current_session
    session[:session_token]
  end
  
  def current_user
    return nil unless current_session
    @current_user ||= User.find_by(session_token: current_session)
  end
  
  def logged_in?
    !!current_user
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end

  def logout(user)
    user.reset_session_token!
    current_session = nil
  end

  def redirect_if_not_logged_in(path)
    unless logged_in?
      redirect_to path
    end
  end

end
