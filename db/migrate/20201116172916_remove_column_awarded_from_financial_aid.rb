class RemoveColumnAwardedFromFinancialAid < ActiveRecord::Migration[6.0]
  def change
    remove_column :financial_aids, :awarded
  end
end
