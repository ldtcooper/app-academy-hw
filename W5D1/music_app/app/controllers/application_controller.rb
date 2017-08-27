class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    user = User.find_by(authentication_token: session[:authentication_token])
    user.nil? ? nil : user
  end

  def login!(user)
    session[:authentication_token] = user.reset_authentication_token
    p session[:authentication_token]
  end

  def logout!
    current_user.reset_authentication_token
    session[:authentication_token] = nil
  end

end
