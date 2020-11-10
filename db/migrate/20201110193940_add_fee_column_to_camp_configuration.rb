class AddFeeColumnToCampConfiguration < ActiveRecord::Migration[6.0]
  def change
    add_column :camp_configurations, :application_fee_cents, :integer
  end
end
