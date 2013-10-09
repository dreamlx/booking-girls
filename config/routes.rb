Tzk3d::Application.routes.draw do

  resources :menu_lists


  resources :menu_items


  resources :companies

  resources :service_menus

  resources :venues

  resources :technicians

  resources :admin_users

  resources :orders, only: [:index, :show, :create] do
    member do
      post 'pay'
    end
  end
  
  resources :credits, only: [:index]

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'
  resources :tasks
  
  resources :technicians do
    resources :tasks, controller: :tasks 
    
    member do
      put :leave
      put :atwork
      put :booking

      get :comments
      post :add_comment
      delete :remove_comment
    end
  end
  
  resources :categories

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  resources :home do
    collection do
      get :services
      get :venues
      get :technicians
    end
  end
end
