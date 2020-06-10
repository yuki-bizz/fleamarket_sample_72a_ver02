Rails.application.routes.draw do
  
  #devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'}

    
  resources :displays

  # ペタうち確認用
  get 'static/my_page'

  # my_pageサイドメニューから確認用 add kazoe
  get 'static/regist'
  get 'static/card'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "displays#index"
end