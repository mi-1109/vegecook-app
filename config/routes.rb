Rails.application.routes.draw do
  namespace :admin do
    get 'chats/show'
  end
  namespace :admin do
    get 'inquiries/index'
    get 'inquiries/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
  end
  namespace :admin do
    get 'recipes/index'
    get 'recipes/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'premiums/payment'
    get 'premiums/complete'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/quit_confirm'
  end
  namespace :public do
    get 'searches/index'
  end
  namespace :public do
    get 'rankings/index'
  end
  namespace :public do
    get 'recipes/index'
    get 'recipes/new'
    get 'recipes/show'
    get 'recipes/edit'
  end
  namespace :public do
    get 'chats/show'
  end
  namespace :public do
    get 'inquiries/index'
    get 'inquiries/new'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
    get 'homes/premium'
  end
  devise_for :users
  root to: 'homes#top'
end
