class Booking < ApplicationRecord
  validates :username, :booked_for, :teacher_id, :city_id, presence: true
end
