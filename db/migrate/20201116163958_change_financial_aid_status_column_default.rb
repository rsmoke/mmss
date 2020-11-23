class ChangeFinancialAidStatusColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :financial_aids, :status, :string, default: "pending"
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
