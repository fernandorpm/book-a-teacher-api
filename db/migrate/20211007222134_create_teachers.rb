class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.text :details
      t.belongs_to :subject, index: true, foreign_key: true

      t.timestamps
    end
  end
end
