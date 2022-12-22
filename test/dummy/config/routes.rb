Rails.application.routes.draw do
  devise_for :users
  resources :posts

  mount RailsComments::Engine => "/rails_comments"
end
