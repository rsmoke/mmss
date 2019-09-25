class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.references :camp_occurrence, null: false, foreign_key: true
      t.string :title
      t.integer :available_spaces
      t.string :status

      t.timestamps
    end
  end
end
