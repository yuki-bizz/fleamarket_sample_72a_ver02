Rails.application.routes.draw do
  
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
  resources :goods_items
  # 商品情報編集ページから商品詳細ページへの遷移 add oikawa
  patch '/goods_items/show'
  # get 'goods_items/:id/edit', to: 'goods_items#edit'
  # patch 'goods_items/:id/edit', to: 'goods_items#update'
  


##### ペタうち確認用 staticここから（必要なくなったら消しましょう） #####

  # トップページからの遷移 add ozaki
  get 'static/regist'
  get 'goods_items/new'
  # get 'static/exhibition'
  get 'static/detail_test'
  
 # my_page add kazoe
  get 'static/my_page'

  # my_pageサイドメニューから確認用 add kazoe
  get 'static/regist'
  get 'static/card'

  # 商品購入確認ページの確認用 add tsutsumi
  get 'static/goods_confirm'

#### /ペタうち確認用 staticここまで（必要なくなったら消しましょう） #####


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "displays#index"

end