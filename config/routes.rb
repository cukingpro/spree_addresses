Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  	namespace :api do
  		resources :addresses
  		get "user_addresses" => "/spree/api/addresses#user_addresses"
  	end
end
