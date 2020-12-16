class AddColumnToFinancialAid < ActiveRecord::Migration[6.0]
  def change
    add_column :financial_aids, :payments_deadline, :date
  end
end
