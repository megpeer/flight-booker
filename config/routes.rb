Rails.application.routes.draw do
  root 'flights#index'
  resources :flights do
    resources :airports
    collection do
      get :search
    end
  end
  resources :airports do
    resources :flights
  end
end
