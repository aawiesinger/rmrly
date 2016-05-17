Rails.application.routes.draw do
  
  root 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'sessions/new'
  get 'user/new'
  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root '/index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get '/signup' => 'users#signup'
  get '/login' => 'users#login'
  #get '/survey' => 'users#survey'
  
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  get '/chat/:user1/:user2' => 'messages#chat', as: :chat

  post '/send/:user1/:user2' => 'messages#send_message', as: :send_message
  
  get '/users/:user1/survey' => 'users#survey', as: :survey
  post '/users/:user1/send_survey' => 'users#send_survey', as: :send_survey
  
  get '/matches/:logged_in_user' => 'users#view_matches', as: :view_matches
  post '/matches/:logged_in_user' => 'users#generate_matches', as: :generate_matches
  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :users

  # Example resource route with options:
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
  

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
