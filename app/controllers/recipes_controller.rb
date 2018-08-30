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
