class ChangeActivityColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :activities, :cost_cents, 'integer USING CAST(cost_cents AS integer)'
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
