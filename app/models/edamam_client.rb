require 'httparty'

#edamam_client.rb

# EdamamClient class for interacting with the Edamam recipe API.
class EdamamClient
  include HTTParty
  base_uri 'https://api.edamam.com/api/recipes/v2'

  # Initialize the EdamamClient with API credentials.
  def initialize
    @app_id = ENV['EDAMAM_APP_ID']
    @app_key = ENV['EDAMAM_APP_KEY']
  end

  # Perform a recipe search using ingredients.
  # @param ingredients [String] The search query.
  # @return [Array<Hash>] An array of recipe data hashes.
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

  private

  # Process recipe hits and extract relevant recipe information.
  # @param recipe_hits [Array<Hash>] An array of recipe hits.
  # @return [Array<Hash>] An array of recipe data hashes.
  def process_recipes(recipe_hits)
    # Extract only the recipe information from each hit
    recipe_hits.map do |hit|
      recipe_data = hit['recipe']
      {
        'title' => recipe_data['label'],
        'url' => recipe_data['url'],
        'image' => recipe_data['image']
      }
    end
  end

  # Future possible implementation to search by recipe separately
  # def process_recipes(recipe_hits)
  #   recipe_hits.each do |recipe_hit|
  #     recipe_data = recipe_hit['recipe']
  #     Recipe.create(
  #       title: recipe_data['label'],
  #       url: recipe_data['url'],
  #       image: recipe_data['image'],
  #     )
  #   end
  # end

  # Handle API errors.
  # @param response [HTTParty::Response] The API response.
  def handle_api_error(response)
    puts "API request failed with status code: #{response.code}"
    puts "Response body: #{response.body}"
  end

  # Format ingredients string for API request.
  # @param ingredients [String] The raw ingredients string.
  # @return [String] The formatted ingredients string.
  def format_ingredients(ingredients)
    # Split the input string by spaces, remove any empty elements, and join with commas
    ingredients.split(' ').reject(&:empty?).join(',')
  end

end