module Api::V1
  class SubjectsController < ApplicationController
    def index
      @subject = Subject.order(name: :asc)
      render json: @subject
    end
  end
end
