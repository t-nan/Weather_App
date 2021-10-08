Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :weathers, only: [] do

    collection do
      get :current
      get :historical
      get :max
      get :min
      get :avg
      get :by_time
    end

  end
end
