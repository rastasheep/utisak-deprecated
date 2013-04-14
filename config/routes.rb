BaseApp::Application.routes.draw do

  devise_for :users, controllers: {sessions: 'sessions'}

  get "pages/index"

  match "/admin" => "admin/base#index", :as => "admin"

  namespace "admin" do

    resources :users

  end

  namespace :api do
    namespace :v1 do
      resources :news
      resources :users
    end
  end

  root :to => "pages#index"

  get '*ember' => 'pages#index'

end
