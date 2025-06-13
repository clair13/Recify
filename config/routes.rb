Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, skip: [:registrations]
  
  resources :recipes do
    collection do
      get :search
    end
    resources :steps
    resources :ingredients
  end

  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end

  root "recipes#index"

  get "admin" => "admin#index"
end
