# config/routes.rb
Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end
  resources :job_postings do
    member do
      post 'apply'
    end
  end
  resources :job_offers
  resources :applications
  get 'users/applications', to: 'users#applications', as: 'user_applications'
end
