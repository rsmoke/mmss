class CreateCoursePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :course_preferences do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.integer :ranking

      t.timestamps
    end
  end
end
