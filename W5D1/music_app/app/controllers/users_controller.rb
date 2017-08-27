class UsersController < ApplicationController

  def new
    @user = User.new
    render view: new_user_url
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user.id)
    else
      flash[:errors] = @user.errors.full_messages
    end
  end

  def show
    @user = User.find(params[:id])
    render view: user_url(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
