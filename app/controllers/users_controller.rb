class UsersController < ApplicationController

  def show
    @message = params[:message] if params[:message]
    @message ||= false
  end

end
