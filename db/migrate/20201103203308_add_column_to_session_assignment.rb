class AddColumnToSessionAssignment < ActiveRecord::Migration[6.0]
  def change
    add_column :session_assignments, :offer_status, :string
  end
end
