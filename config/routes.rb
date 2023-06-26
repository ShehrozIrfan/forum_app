Rails.application.routes.draw do
  devise_for :users

  resources :forum_threads do
    resources :forum_posts
  end

  root "forum_threads#index"
end
