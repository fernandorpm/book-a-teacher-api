class Booking < ApplicationRecord
  validates :username, :booked_for, :teacher_id, :city_id, presence: true

  belongs_to :teacher
  belongs_to :city

  def self.json_list
    order(booked_for: :asc)
      .includes(:city, teacher: :professional_photo_attachment)
      .map do |booking|
      {
        id: booking.id,
        username: booking.username,
        teacher: booking.teacher.name,
        subject: booking.teacher.subject.name,
        city: booking.city.name,
        professional_photo: booking.teacher&.photo_url,
        booked_for: booking.booked_for
      }
    end
  end
end
