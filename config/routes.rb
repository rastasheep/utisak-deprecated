BaseApp::Application.routes.draw do

  devise_for :users, controllers: {sessions: 'sessions'}

  # get "pages/index"

  match "/admin" => "admin/base#index", :as => "admin"

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


  resources :news, :path => '/'

  get '/beta' => 'pages#index'

end
