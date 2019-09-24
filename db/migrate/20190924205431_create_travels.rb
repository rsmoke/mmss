class CreateTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :travels do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.string :direction
      t.string :transport_needed
      t.datetime :date
      t.string :mode
      t.string :carrier
      t.string :route_num
      t.text :note

      t.timestamps
    end
  end
end
