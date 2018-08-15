Rails.application.routes.draw do


                                                 #ログイン切り替え
  devise_for :admins
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }


                                            #問い合わせフォーム

  get 'contact' => 'contact#index'
  post 'contact/confirm' => 'contact#confirm'
  post 'contact/thanks' => 'contact#thanks'


                                            #会社情報・就業情報
  resources :companies do
        #コメント
    resources :comments, only: [:create, :destroy]
    member do
      get :progress
    end
 end

  #都道府県
    resources :prefectures
  #請求書
    resources :invoices
  #就業規則
    resources :employments

                                                         #FAQ
  resources :faqs

                                                   #表側ページ
  get '/' => 'tops#subsidy'
  get '/company' => 'tops#company'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
