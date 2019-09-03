class CreateEnrollmentActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollment_activities do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
