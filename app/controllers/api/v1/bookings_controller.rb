module Api::V1
  class BookingsController < ApplicationController
    def index
      # Once we have the username headers, we are going to index only the user's bookings
      # But for now, we are going to render all of them
      @bookings = Booking.json_list
      render json: @bookings
    end

    def create
      @booking = Booking.new(booking_params)

      if @booking.save
        render json: { status: 'SUCCESS', message: 'You booked a time with a Teacher!', data: @booking },
               status: :created
      else
        render json: { status: 'ERROR', message: 'Failed to book a time', error: @booking.errors },
               status: :unprocessable_entity
      end
    end

    def destroy
      @booking = Booking.find(params[:id])
      @booking.destroy
      render json: { status: 'SUCCESS', message: 'Booking canceled', data: @booking }, status: :accepted
    end

    private

    def booking_params
      params.permit(:username, :booked_for, :teacher_id, :city_id)
    end
  end
end
