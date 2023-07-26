require 'httparty'

class EdamamClient
  include HTTParty
  base_uri 'https://api.edamam.com/api/recipes/v2'

  def initialize
    @app_id = ENV['EDAMAM_APP_ID']
    @app_key = ENV['EDAMAM_APP_KEY']
  end

  def search_by_ingredients(ingredients)
    formatted_ingredients = format_ingredients(ingredients)
    response = self.class.get('', query: { q: formatted_ingredients, app_id: @app_id, app_key: @app_key, type: 'public'})

    if response.success?
      data = JSON.parse(response.body)
      process_recipes(data['hits'])
    else
      handle_api_error(response)
    end
  end

  # def search_by_recipe(name)
  #   response = self.class.get('/search', query: { q: name, app_id: @app_id, app_key: @app_key, type: 'public' })

  #   if response.success?
  #     data = JSON.parse(response.body)
  #     process_recipes(data['hits'])
  #   else
  #     handle_api_error(response)
  #   end
  # end

  private

  def process_recipes(recipe_hits)
    recipe_hits.each do |recipe_hit|
      recipe_data = recipe_hit['recipe']
      Recipe.create(
        title: recipe_data['label'],
        url: recipe_data['url'],
        image: recipe_data['image'],
      )
    end
  end

  def handle_api_error(response)
    puts "API request failed with status code: #{response.code}"
    puts "Response body: #{response.body}"
  end

  def format_ingredients(ingredients)
    # Split the input string by spaces, remove any empty elements, and join with commas
    ingredients.split(' ').reject(&:empty?).join(',')
  end

end