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
  end

  def create
    #we need to create the recipe by converting the textarea param into a set of items, which we create and use to associate or create ingredients
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
    params.require(:recipe).permit(:name, :rating, :makes, :comments) #this may be wrong - how do we set strong param validations when we don't actually want to check what we're passing in?
  end

  def create_ingredient_items
    #should this just be an items method we call?
  end

end
