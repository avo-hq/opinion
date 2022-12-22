Rails.application.routes.draw do
  resources :posts
  mount RailsComments::Engine => "/rails_comments"
end
