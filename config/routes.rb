Rails.application.routes.draw do
  resources :sub_word_joins
  resources :words
  resources :comment_sub_joins
  resources :comment_word_joins
  resources :companies
  resources :teams
  resources :comments
  resources :dashboard
  resources :drivers
  resources :sub_drivers


  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
