Rails.application.routes.draw do

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :teachers, only: %i[index show create destroy]
      resources :bookings, only: %i[index create destroy]
      
      resources :subjects, only: %i[index]
      resources :cities, only: %i[index]
    end
  end

  root 'api/v1/teachers#index'
  
end
