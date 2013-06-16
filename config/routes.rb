Utisak::Application.routes.draw do

  devise_for :users

  resources :users, :only => [:show]

  get "/admin" => "admin/base#index", :as => "admin"
  get "/about" => "pages#about"
  get "/api" => "pages#api"
  get "/markdown" => "pages#markdown"

  namespace "admin" do
    resources :users
  end

  namespace :api do
    namespace :v1 do
      resources :news do
        member do
          post  "vote"
        end
      end
      resources :users
      resources :comments
    end
  end

  match "/newest" => "news#newest"

  resources :news, :path => '/' do
    member do
      post  "vote"
    end
    resources :comments
  end


end
