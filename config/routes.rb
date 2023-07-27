# routes.rb

Rails.application.routes.draw do
  # Define routes for the RecipesController.
  resources :recipes, only: [:index, :show]

  # Define a custom route to show all stored recipes in a separate page.
  get '/stored_recipes', to: 'recipes#all_recipes', as: 'stored_recipes'

  # Set the root page to the index action of RecipesController.
  root "recipes#index"
end
