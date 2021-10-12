class Teacher < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :name, :subject_id, :details, presence: true

  has_many :bookings, dependent: :destroy
  belongs_to :subject

  @min_size = 0.megabytes
  @max_size = 5.megabytes

  has_one_attached :professional_photo
  validates :professional_photo, presence: true, blob: {
    content_type: [
      'image/png',
      'image/jpg',
      'image/jpeg'
    ],
    size_range: @min_size..@max_size
  }

  def self.json_list
    with_attached_professional_photo
      .includes(:subject).map do |teacher|
      {
        id: teacher.id,
        name: teacher.name,
        details: teacher.details,
        professional_photo: teacher&.photo_url,
        subject: teacher.subject.name
      }
    end
  end

  def json_single
    {
      id: id,
      name: name,
      details: details,
      professional_photo: photo_url,
      subject: subject.name
    }
  end

  def photo_url
    url_for(professional_photo)
  end
end
