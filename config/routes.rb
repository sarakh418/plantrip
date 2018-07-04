Rails.application.routes.draw do
  devise_for :users
   resources :posts, only: [:create, :edit, :update, :index]
    delete "posts/:id" => "posts#destroy", as: "post_destroy"

 root "posts#index"
end
