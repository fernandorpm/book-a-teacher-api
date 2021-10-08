class Teacher < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :subject

  validates :name, :subject_id, :details, presence: true

  def self.with_subject
    includes(:subject).map do |teacher|
      {
        id: teacher.id,
        name: teacher.name,
        subject: teacher.subject.name
      }
    end
  end
end
