class AddCostToCampOccurrences < ActiveRecord::Migration[6.0]
  def change
    add_column :camp_occurrences, :cost_cents, :integer
  end
end
