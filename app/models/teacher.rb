class Teacher < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, :subject_id, :details, presence: true
end
