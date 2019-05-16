Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'sessions/create'
      get 'sessions/destroy'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :schools, only: [:index, :show, :create, :destroy] do
        resource :students, only: [:index, :show, :create, :destroy]
        resource :classrooms, only: [:create, :destroy] do
          post :randomizer
        end
      end
    end
  end
end
