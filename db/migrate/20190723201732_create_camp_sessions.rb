class CreateCampSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :camp_sessions do |t|
      t.references :camp_configuration, null: false, foreign_key: true
      t.string :description, null: false
      t.date :begin_date, null: false
      t.date :end_date, null: false
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end
