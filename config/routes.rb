Rails.application.routes.draw do
  # resources :posts, only: [:index, :show, :create, :update, :destroy] do
  #   resources :comments, only: [:index, :show, :create, :update, :destroy]
  # end

  scope module: :api do
    scope module: :v1 do
      get '/posts',        to: 'posts#index'
      get '/posts/:id',    to: 'posts#show'
      post '/posts',       to: 'posts#create'
      put '/posts/:id',    to: 'posts#update'
      patch '/posts/:id',  to: 'posts#update'
      delete '/posts/:id', to: 'posts#destroy'
      
      scope :posts do
        get '/:post_id/comments',        to: 'comments#index'
        get '/:post_id/comments/:id',    to: 'comments#show'
        post '/:post_id/comments',       to: 'comments#create'
        put '/:post_id/comments/:id',    to: 'comments#update'
        patch '/:post_id/comments/:id',  to: 'comments#update'
        delete '/:post_id/comments/:id', to: 'comments#destroy'
      end
    end
  end
end
