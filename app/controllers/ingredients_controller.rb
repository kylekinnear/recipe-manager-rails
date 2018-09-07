class IngredientsController < ApplicationController

  def show
    @ingredient = Ingredient.find(params[:id])
    @message = params[:message] if params[:message]
    @message ||= false
  end

  def index
  end

  def most_used
    @ingredient = Ingredient.most_used
    redirect_to ingredient_path(@ingredient)
  end

end
