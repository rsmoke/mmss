class SetAwardedToDefaultFalseToFinancialAid < ActiveRecord::Migration[6.0]
  def change
    change_column_default :financial_aids, :awarded, from: nil, to: false
  end
end
