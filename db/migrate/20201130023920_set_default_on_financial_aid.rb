class SetDefaultOnFinancialAid < ActiveRecord::Migration[6.0]
  def up
    change_column :financial_aids, :amount_cents, :integer, default: 0
    end
end
