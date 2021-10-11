Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :teachers, only: %i[index show create destroy]
      resources :bookings, only: %i[index create destroy]
    end
  end

  root 'api/v1/teachers#index'
  
end
