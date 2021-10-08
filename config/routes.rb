Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :teachers, only: %i[index show create destroy]
    end
  end
  
end
