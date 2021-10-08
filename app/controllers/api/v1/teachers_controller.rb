module Api::V1
  class TeachersController < ApplicationController
    def index
      @teachers = Teacher.with_subject
      render json: @teachers
    end

    def show
      @teacher = Teacher.find(params[:id])
      render json: @teacher
    end

    def create
      @teacher = Teacher.new(teacher_params)
      if @teacher.save
        render json: { status: 'SUCCESS', message: 'Teacher Saved', data: @teacher }, status: :ok
      else
        render json: {status: 'ERROR', message: 'Teacher not saved', data: @teacher.errors },status: :unprocessable_entity
      end
    end

    def destroy
      @teacher = Teacher.find(params[:id])
      @teacher.destroy
      render json: { status: 'SUCCESS', message: 'Teacher Deleted', data: @teacher }, status: :ok
    end

    private

    def teacher_params
      params.permit(:name, :subject_id, :details)
    end

  end
end
