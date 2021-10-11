module Api::V1
  class CitiesController < ApplicationController
    def index
      @cities = City.order(name: :asc)
      render json: @cities
    end
  end
end
