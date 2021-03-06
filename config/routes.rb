BingoCaller::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  #resources :player_games

  #resources :bingo_sessions
  resources :bingo_sessions do
    resources :players
  #  resources :games
  end

  root :to => "bingo_sessions#index"

  match 'bingo_sessions/:id/show_current_game' => 'bingo_sessions#show_current_game'

  devise_for :callers

  #resources :called_numbers


  match 'games/:id/next_ball' => 'games#next_ball', :via => [:post]
  match 'games/:id/auto_toggle' => 'games#auto_toggle', :via => [:post]
  match 'games/:id/record_winner_line' => 'games#record_winner_line', :via => [:post]
  match 'games/:id/record_winner_bingo' => 'games#record_winner_bingo', :via => [:post]
  match 'games/:id/same_again' => 'games#same_again'
  match 'games/:id/status' => 'games#game_status'

  resources :games do
    resources :player_games
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
