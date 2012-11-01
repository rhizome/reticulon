Reticulon::Application.routes.draw do
  resources :users
  resources :invitations, :only => [:create, :show]
  resources :homes
  root :to => 'invitations#index'
  # launch:
  # root :to => 'homes#index'
end
