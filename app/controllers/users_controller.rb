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

end
