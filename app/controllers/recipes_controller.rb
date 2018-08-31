require 'pry'
require 'active_support/inflector'

class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
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
    if @recipe.save
      @recipe.items.each do |item|
        if item.ingredient_name
          item.ingredient = Ingredient.find_or_create_by(name: item.ingredient_name.downcase.singularize)
        end
      end
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
    params.require(:recipe).permit(:name, :rating, :makes, :comments, items_attributes: [:id, :quantity, :unit, :ingredient_name])
  end

end
