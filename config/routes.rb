Rails.application.routes.draw do

 # ============== deviiseのルーティング ==================
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

    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings'
      get 'followers' => 'relationships#followers'
    end
    get 'users/quit_confirm' => 'users#quit_confirm'
    patch 'users/quit' => 'users#quit'

    resources :premiums, only: [:update]
    get 'premiums/payment' => 'premiums#payment'
    get 'premiums/complete' => 'premiums#complete'
  end

  # ========= 管理者(admin)のルーティング ================
  namespace :admin do
    root to: 'homes#top'
    resources :recipes, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :destroy]
    resources :inquiries, only: [:index, :show]
    resources :chats, only: [:show, :create]
  end

end
