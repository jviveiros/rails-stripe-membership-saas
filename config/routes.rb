Rails.application.routes.draw do
  get "content/silver"
  get "content/gold"
  get "content/platinum"
  mount VGS::Engine => '/vgs', as: :vgs
  root to: 'visitors#index'
  get 'products/:id', to: 'products#show', :as => :products
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'change_plan', :to => 'registrations#change_plan'
  end
  resources :users
end
