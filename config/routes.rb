Rails.application.routes.draw do
  resources :mutants, except: [:show], format: 'html'
  resources :teams, except: [:show], format: 'html'

  root :to => 'teams#index'
end
