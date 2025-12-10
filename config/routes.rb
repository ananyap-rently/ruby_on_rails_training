Rails.application.routes.draw do
    resources :tasks
  root "articles#index"
  
   get  "/signup", to: "users#new"     # show signup form
  post "/signup", to: "users#create"  # submit signup form

  # # Login/logout routes
  # get    "/login",  to: "sessions#new"
  # post   "/login",  to: "sessions#create"
  # delete "/logout", to: "sessions#destroy"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "articles/about", to: "articles#about", as: :about
  resources :tasks
  resources :friends
  resources :articles do
    resources :comments
  end
  
  # get "articles/index"
  # get "articles", to: "articles#index"
  
  # get "articles/:id", to: "articles#show"

  # get "articles/about", to: "articles#about" as: :about
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
