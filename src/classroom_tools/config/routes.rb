Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :school, only: [:index, :show, :create, :destroy] do
        resource :students, only: [:index, :show, :create, :destroy]
        resource :classroom, only: [:create, :destroy] do
          post :randomizer
        end
      end
    end
  end
end
