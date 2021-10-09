class Teacher < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :professional_photo

  has_many :bookings, dependent: :destroy
  belongs_to :subject

  validates :name, :subject_id, :details, :professional_photo, presence: true

  def self.teachers_json
    includes(:subject).map do |teacher|
      {
        id: teacher.id,
        name: teacher.name,
        details: teacher.details,
        professional_photo: teacher&.photo_url,
        subject_name: teacher.subject.name
      }
    end
  end

  def teacher_json
    {
      id: self.id,
      name: self.name,
      details: self.details,
      professional_photo: photo_url,
      subject_name: subject_name
    }
  end

  def subject_name
    Subject.find(subject_id).name
  end

  def photo_url
    url_for(self.professional_photo)
  end
end
