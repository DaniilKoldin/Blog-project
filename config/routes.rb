Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users

    root "posts#index"

    get "/users" => "users#index", as: "users"
    get "/create" => "posts#create_post", as: "create"
    get "/posts/:id" => "posts#show"
    get "/sponsors" => "posts#sponsors", as: "sponsors"
    get "/edit/:id" => "posts#edit", as: "edit"
    # get "/posts/:id"

    patch "posts.:id" => "posts#update", as: :update_post
    get '/:locale.:id' => 'posts#destroy', as: :destroy_post
    get 'users/:id' => 'users#show_user', as: :show_user
    get 'users/:id' => 'users#destroy', as: :destroy_user
    # get 'comment/:id' => "comment#destroy", as: :destroy_comm

    get 'posts/:post_id/comments(.:format)' => 'comment#create', as: :create_comment

    resources :users
    resources :posts do
      resources :comments
    end
  end
end
