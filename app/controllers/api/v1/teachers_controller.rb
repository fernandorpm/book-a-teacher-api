module Api::V1
  class TeachersController < ApplicationController
    def index
      @teachers = Teacher.json_list
      render json: @teachers
    end

    def show
      @teacher = Teacher.find(params[:id])
      render json: @teacher.json_single
    end

    def create
      @teacher = Teacher.new(teacher_params)
      if @teacher.save
        render json: { status: 'SUCCESS', message: 'Teacher Saved', data: @teacher.json_single }, status: :created
      else
        render json: { status: 'ERROR', message: 'Teacher not saved', data: @teacher.errors },
               status: :unprocessable_entity
      end
    end

    def destroy
      @teacher = Teacher.find(params[:id])
      @teacher.destroy
      render json: { status: 'SUCCESS', message: 'Teacher Deleted', data: @teacher.json_single }, status: :accepted
    end

    private

    def teacher_params
      params.permit(:name, :subject_id, :details, :professional_photo)
    end
  end
end
