class ChangeColumnNameToActivities < ActiveRecord::Migration[6.0]
  def change
    rename_column :activities, :cost_in_cents, :cost_cents
  end
end
