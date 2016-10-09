Rails.application.routes.draw do
  resources :nowscenes
  get 'main/main'
  get 'contact_us/contact'
  resources :feed_backs
  resources :user_panels
  resources :admin_panels
  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_for :admins
  resources :factorial_scene5s
  resources :factorial_scene4s
  resources :factorial_scene3s
  resources :factorial_scene2s
  resources :factorial_scene1s
  resources :factorial_scenes
  resources :scene3s
  resources :scene2s
  resources :scene1s
  resources :space_scene3s
  resources :space_scene2s
  resources :space_scene1s
  resources :space_scene3s
  resources :space_scene2s
  resources :space_scene1s
  resources :position_scene3s
  resources :position_scene2s
  resources :position_scene1s
  resources :colour_scene3s
  resources :colour_scene2s
  resources :colour_scene1s
  resources :colour_scenes
  resources :position_scenes
  resources :space_scenes
  resources :space_scenes
  resources :scenes
  get 'home/index'
  get 'home/home'
  get 'home/vertices_number'
  get "/delete_all_scenes" => "home#delete_all_scenes", as: :delete_all_scenes
  get 'home/delete_all_scenes_vertices'
  get 'home/space_ratio'
  get 'home/delete_all_scenes_space'
  get 'home/space_datapresentation'
  get 'home/position_difference'
  get 'home/delete_all_scenes_position'
  get 'home/position_datapresentation'
  get 'home/colour_difference'
  get 'home/delete_all_scenes_colour'
  get 'home/colour_datapresentation'
  get 'home/factorial'
  get 'home/delete_all_scenes_factorial'
  get 'home/factorial_datapresentation'
  # root 'home#index'
  get "/datapresentation" => "home#datapresentation", as: :datapresentation
  get "/vertices_datapresentation" => "home#vertices_datapresentation", as: :vertices_datapresentation
  get "/arrange" => "home#arrange", as: :arrange
  get "/admin" => "admin_panels#index", as: :admin
  get "/main" => "main#main", as: :main
  get "/user" => "user_panels#index", as: :user
  get "/show_users" => "admin_panels#show_users", as: :show_users
  get "/show_data" => "admin_panels#show_data", as: :show_data
  get "/show_scenes" => "admin_panels#show_scenes", as: :show_scenes
  get "/show_feedback" => "admin_panels#show_feedback", as: :show_feedback
  get "/tutorial" => "user_panels#tutorial", as: :tutorial
  post "/update_scene" => "user_panels#update_scene", as: :update_scene
  post "/validate_scene" => "user_panels#validate_scene", as: :validate_scene
  get "/destroy_user" => "admin_panels#destroy_user", as: :destroy_user
  get "/delete_users" => "admin_panels#delete_users", as: :delete_users
  root 'main#main'
end
