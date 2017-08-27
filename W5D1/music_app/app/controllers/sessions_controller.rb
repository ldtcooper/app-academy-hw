class SessionsController < ApplicationController
  #creates a new session: ie - logs someone in
  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    p user
    if user.nil?
      flash[:errors] = ["Incorrect email and/or password"]
      redirect_to new_session_url
    else
      login!(user)
      redirect_to user_url(user.id)
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  def new
    render view: new_session_url
  end
end
