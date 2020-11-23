class CreateSessionAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :session_assignments do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.references :camp_occurrence, null: false, foreign_key: true

      t.timestamps
    end
  end
end
