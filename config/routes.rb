Rails.application.routes.draw do
  
  #devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'}
    
  devise_scope :user do
    get 'sign_in', :to => 'users/sessions#new'
    get 'sign_out', :to => 'users/sessions#destroy'
  end

  resources :displays

  # ペタうち確認用
  get 'static/my_page'

  # my_pageサイドメニューから確認用 add kazoe
  get 'static/regist'
  get 'static/card'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "displays#index"
end