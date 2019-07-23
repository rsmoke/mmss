class CreateCampConfigurations < ActiveRecord::Migration[6.0]
  def change
    create_table :camp_configurations do |t|
      t.integer :camp_year, null: false
      t.date :application_open, null: false
      t.date :application_close, null: false
      t.date :priority, null: false
      t.date :application_materials_due, null: false
      t.date :camper_acceptance_due, null: false
      t.boolean :active, null: false, default: false

      t.timestamps
    end
    add_index :camp_configurations, :camp_year
  end
end
