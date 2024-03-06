Rails.application.routes.draw do
  get 'book_users/index'
  get 'book_users', to: 'book_users#index'
  get 'book_users/:account_id', to: 'book_users#show'
  get 'profile/edit', to: 'book_users#edit'
  patch 'profile/edit', to: 'book_users#update'
  devise_for :accounts
  resources :books
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
