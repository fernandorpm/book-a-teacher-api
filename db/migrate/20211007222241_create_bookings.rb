class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :username
      t.date :booked_for
      t.belongs_to :teacher, index: true, foreign_key: true
      t.belongs_to :city, index: true, foreign_key: true

      t.timestamps
    end
  end
end
