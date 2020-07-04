Rails.application.routes.draw do
  
  get 'purchase/index'

  get 'purchase/new'

  get 'purchase/create'

  get 'purchase/pay'

  # get 'goods_items/index'

  # get 'goods_items/show'

  # get 'goods_items/new'

  # get 'goods_items/create'

  # get 'goods_items/purchase'

  # get 'goods_items/pay'

  resources :goods_items do
    collection do
      post  'purchase/:id', to: 'goods_items#purchase'
    end
  end

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  devise_for :users
  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   sessions: 'users/sessions'}
    
  # devise_scope :user do
  #   get 'edit_user', :to => 'users/sessions#new'
  #   get 'sign_out', :to => 'users/sessions#destroy'
  # end

  #user my_page add kazoe
  resources :users, only: [:show, :edit, :update]

  get 'users/:id/edit',to: 'users#edit'
  patch 'users/:id/edit',to: 'users#update'

  # resources :displays
  resources :goods_items, only: [:show, :destroy, :edit]


##### ペタうち確認用 staticここから（必要なくなったら消しましょう） #####

  # トップページからの遷移 add ozaki
  get 'static/regist'
  get 'static/exhibition'
  get 'static/detail_test'
  
 # my_page add kazoe
  get 'static/my_page'
  #get 'users/:id' => 'users#show'

  # my_pageサイドメニューから確認用 add kazoe
  get 'static/regist'
  get 'static/card'

  # 商品購入確認ページの確認用 add tsutsumi
  get 'static/goods_confirm'

#### /ペタうち確認用 staticここまで（必要なくなったら消しましょう） #####


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 商品情報編集ページから商品詳細ページへの遷移 add oikawa
  patch '/goods_items/show'
  
  root "displays#index"

end