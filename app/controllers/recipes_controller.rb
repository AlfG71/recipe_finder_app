# recipes_controller.rb

class RecipesController < ApplicationController

  # Show all recipes in the main page.
  def index
    @recipes = Recipe.all
    @search_results = []

    #Check if search query is provided
    if params[:search_query].present?
      edamam_client = EdamamClient.new
      @search_results = edamam_client.search_by_ingredients(params[:search_query])
    end
  end

  # Show details of a specific recipe.
  def show
    @recipe = Recipe.find(params[:id])
  end

  # Show all stored recipes in a separate page.
  def all_recipes
    @recipes = Recipe.all
  end

  private

  # Save recipes to the database from the API response (future possible implementation).
  # @param recipe_hits [Array<Hash>] An array of recipe hits.
  def save_recipes(recipe_hits)
    recipe_hits.each do |recipe_hit|
      recipe_data = recipe_hit['recipe']
      Recipe.create(
        title: recipe_data['label'],
        url: recipe_data['url'],
        image: recipe_data['image'],
      )
    end
  end

end
