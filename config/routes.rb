Rails.application.routes.draw do

  resources :tasks, format: 'html'
  resources :mutants, except: [:show], format: 'html'
  resources :teams, except: [:show], format: 'html'

  root :to => 'tasks#index'
end
