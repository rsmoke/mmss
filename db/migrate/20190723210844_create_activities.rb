class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.references :camp_occurrence, null: false, foreign_key: true
      t.string :description, null: false
      t.string :cost_in_cents, null: false
      t.date :date_occurs, null: false
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end
