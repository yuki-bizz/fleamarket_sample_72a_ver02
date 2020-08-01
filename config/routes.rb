Rails.application.routes.draw do
  
  get 'purchase/new'

  get 'purchase/create'

  get 'purchase/purchase'

  get 'purchase/done'

  get 'cards/new'

  get 'cards/show'

  devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations'
}


  #user my_page add kazoe
  resources :users, only: [:show, :edit, :update]


  get 'users/:id/edit',to: 'users#edit'
  patch 'users/:id/edit',to: 'users#update'
  get 'static/tos'
  get 'static/privacy'

  # resources :displays
  # resources :goods_items, except: :index
  # resources :goods_items

  resources :goods_items do
    collection do 
      get 'check'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
   end
  
   resources :searches,only:[:index]

   # comment機能 add oikawa
  resources :goods_items do
    resources :comments, only: [:create]
  end

##### ペタうち確認用 staticここから（必要なくなったら消しましょう） #####

  # トップページからの遷移 add ozaki
  get 'static/regist'
  # get 'static/exhibition'
  # get 'static/detail_test'

  
 # my_page add kazoe
  get 'static/my_page'

  # my_pageサイドメニューから確認用 add kazoe
  get 'static/regist'
  get 'static/card'

  # 商品購入確認ページの確認用 add tsutsumi
  get 'static/goods_confirm'

#### /ペタうち確認用 staticここまで（必要なくなったら消しましょう） #####


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "goods_items#index"

  #  クレジットカード登録関係
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  #  クレジットカード支払関係
  resources :orders do
    member do
      get 'goods_confirm', to: 'orders#goods_confirm'
      post 'pay', to: 'orders#pay'
      get 'done', to: 'orders#done'
      get 'show', to: 'orders#show'
    end
  end
  
end