class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all

    #Check if search query is provided
    if params[:search_query].present?
      edamam_client = EdamamClient.new
      @search_results = edamam_client.search_by_ingredients(params[:search_query])

    # Handle API response
      # if @search_result
      #   save_recipes(@search_result)
      #   flash[:notice] = "Recipes successfully fetched and saved!"
      # else
      #   flash[:alert] = "No recipes found for the provided search query."
      # end
    end

    # if flash[:alert].nil? && flash[:notice].nil?
    #   flash[:alert] = "API request failed with status code: 404. Please try again later."
    # end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def save_recipes(recipe_hits)
    recipe_hits.each do |recipe_hit|
      recipe_data = recipe_hit['recipe']
      Recipe.create(
        title: recipe_data['label'],
        url: recipe_data['url'],
        image: recipe_data['image'],
      )
    end
    # edamam_client = EdamamClient.new
    # edamam_client.process_recipes(recipe_hits)
  end

end
