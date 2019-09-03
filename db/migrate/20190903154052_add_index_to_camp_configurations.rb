class AddIndexToCampConfigurations < ActiveRecord::Migration[6.0]
  def change
    remove_index :camp_configurations, :camp_year
    add_index :camp_configurations, :camp_year, unique: true
  end
end
