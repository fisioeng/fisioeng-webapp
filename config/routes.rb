Rails.application.routes.draw do
  root to: "companies#index"

  match ':sampling_id/m/new/', to: 'measures#create', as: :measure_new, via: [:post]

  resources :specie_profiles

  resources :companies do
    resources :branches do
      resources :analytes do
        resources :samplings do
          resources :measures, except: [:create, :new, :edit, :update, :destroy]
        end
      end
    end
  end


  devise_for :users, skip: [:passwords]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
