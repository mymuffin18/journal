Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'api/v1/sessions',
    registrations: 'api/v1/registrations'
  },
  defaults: {format: :json}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :categories, only: [:index, :show, :create, :update, :destroy]
      resources :tasks, only: [:index, :show, :create, :update, :destroy ]
      resources :members, only: [:index]
      
    end
  end
end
