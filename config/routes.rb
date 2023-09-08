Rails.application.routes.draw do
  resources :job_postings
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'devise/sessions#new'
  # Defines the root path route ("/")
  # root "articles#index"
end
