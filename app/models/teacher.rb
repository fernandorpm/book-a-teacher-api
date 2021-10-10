class Teacher < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :name, :subject_id, :details, presence: true

  has_many :bookings, dependent: :destroy
  belongs_to :subject

  @min_size = 0
  @max_size = 5

  has_one_attached :professional_photo
  validates :professional_photo, presence: true, blob: {
    content_type: [
      'image/png',
      'image/jpg',
      'image/jpeg'
    ],
    size_range: @min_size..@max_size.megabytes
  }

  def self.json_list
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

  def json_single
    {
      id: id,
      name: name,
      details: details,
      professional_photo: photo_url,
      subject_name: subject_name
    }
  end

  def subject_name
    Subject.find(subject_id).name
  end

  def photo_url
    url_for(professional_photo)
  end
end
