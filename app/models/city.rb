class City < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
end
