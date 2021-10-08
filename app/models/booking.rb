class Booking < ApplicationRecord
  belongs_to :teacher
  belongs_to :city

  validates :username, :booked_for, :teacher_id, :city_id, presence: true
end
