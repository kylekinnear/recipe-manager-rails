require 'pry'
require 'active_support/inflector'

class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @recipes = @user.recipes
    else
      @recipes = Recipe.all
    end
  end

  def show
    @message = params[:message] if params[:message]
    @message ||= false
  end

  def new
    @recipe = Recipe.new
    5.times do @recipe.items.build end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.items.first.has_ingredient_name? #recipes need at least 1 ingredient
      @recipe.items.each do |item|
        if item.is_valid_or_blank?
          item.find_or_create_ingredient
        else
          render :new, notice: 'Unable to create recipe - ingredient items need a quantity and an ingredient' and return
        end
      end
    else
      render :new, notice: 'Unable to create recipe - make sure to include at least one ingredient.' and return
    end
#    binding.pry
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: 'Successfully added the recipe'
    else
      render :new, notice: 'Unable to create recipe. Check inputs'
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :rating, :makes, :comments, :serves, items_attributes: [:id, :quantity, :unit, :ingredient_name])
  end

end
