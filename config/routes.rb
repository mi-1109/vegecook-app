Rails.application.routes.draw do

 # ============== deviseのルーティング ==================
  devise_for :admins,
    path: :admin,
    controllers: {
      sessions: 'admin/devise/sessions',
      passwords: 'admin/devise/passwords',
      registrations: 'admin/devise/registrations'
    }
  devise_for :users,
    controllers: {
      sessions: 'public/devise/sessions',
      passwords: 'public/devise/passwords',
      registrations: 'public/devise/registrations'
    }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/devise/sessions#guest_sign_in'
  end

  devise_scope :admin do
    post 'admin/guest_sign_in', to: 'admin/devise/sessions#guest_sign_in'
  end

  # ========= ユーザー(public)のルーティング ================
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'premium' => 'homes#premium'

    resources :form_inquiries, only: [:index, :new, :create]
    get 'form_inquiries/complete' => 'form_inquiries#complete', as: 'form_inquiry_complete'
    resource :chats, only: [:show, :create]

    get 'post_recipes/searches' => 'searches#index'
    get 'post_recipes/rankings' => 'rankings#index'
    get 'users/quit_confirm' => 'users#quit_confirm'
    patch 'users/quit' => 'users#quit'

    resources :post_recipes do
      resources :comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
      resource :saved_recipes, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit, :update] do
      post 'relationships/:page_user_id' => 'relationships#create', as:'add_follow'
      delete 'relationships/:page_user_id' => 'relationships#destroy', as:'remove_follow'
      get :follows, on: :member
    end

    resource :premiums, only: [:update]
    get 'premiums/payment' => 'premiums#payment'
    get 'premiums/complete' => 'premiums#complete'
  end

  # ========= 管理者(admin)のルーティング ================
  namespace :admin do
    root to: 'homes#top'
    resources :post_recipes, only: [:index, :show, :destroy]
    resources :form_inquiries, only: [:index, :show, :update]
    resources :chats, only: [:index, :show, :create]
    resources :users, only: [:index, :show, :edit, :update]
  end

  # get '*path', controller: 'application', action: 'render_404'

end
