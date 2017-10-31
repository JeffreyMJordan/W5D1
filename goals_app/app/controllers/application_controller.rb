class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    user = User.find_by_session_token(session[:session_token])
    return user
  end

  def login(user)
    session[:session_token] = user.session_token
  end
end
