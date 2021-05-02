Rails.application.routes.draw do

 # ============== deviseのルーティング ==================
  devise_for :admins,
    path: :admin,
    controllers: {
      sessions: 'admin/devise/sessions',
      passwords: 'admin/devise/passwords',
      registrations: 'admin/devise/registrations'
    }
  devise_for :users, controllers: {
      sessions: 'public/devise/sessions',
      passwords: 'public/devise/passwords',
      registrations: 'public/devise/registrations'
    }

  # ========= ユーザー(public)のルーティング ================
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'premium' => 'homes#premium'

    resources :inquiries, only: [:index, :new, :create]
    resources :chats, only: [:show, :create]

    resources :recipes do
      resources :recipe_comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end
    get 'recipes/searches' => 'searches#index'
    get 'recipes/rankings' => 'rankings#index'

    get 'users/quit_confirm' => 'users#quit_confirm'
    patch 'users/quit' => 'users#quit'

    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get :follows, on: :member
    end

    resources :premiums, only: [:update]
    get 'premiums/payment' => 'premiums#payment'
    get 'premiums/complete' => 'premiums#complete'
  end

  # ========= 管理者(admin)のルーティング ================
  namespace :admin do
    root to: 'homes#top'
    resources :recipes, only: [:index, :show]
    delete 'recipes/:id' => 'recipes#destroy', as: 'destroy_recipe'
    resources :inquiries, only: [:index, :show]
    resources :chats, only: [:show, :create]
    resources :users, only: [:index, :show, :edit, :update]
  end

end
