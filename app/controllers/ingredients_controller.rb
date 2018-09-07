class IngredientsController < ApplicationController

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def index
#    if params[:user_id]
#      @user = User.find(params[:user_id])
#      @ingredients = @user.ingredients
#    else
      @ingredients = Ingredient.all
#    end
  end

  def most_used
    @ingredient = Ingredient.most_used
    redirect_to ingredient_path(@ingredient)
  end

end
