class UsersController < ApplicationController

  def show
    @message = params[:message] if params[:message]
    @message ||= false
  end

  def new
    @user  = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      #redirect
    else
      #redirect
    end
  end

  def update
    if @user.update(user_params)
      #redirect to user home with message
    else
      #redirect to edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
