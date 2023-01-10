RailsComments::Engine.routes.draw do
  root "home#index"

  resources :comments do
    member do
      post :react
    end
  end
end
