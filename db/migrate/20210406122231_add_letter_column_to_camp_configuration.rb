class AddLetterColumnToCampConfiguration < ActiveRecord::Migration[6.0]
  def change
    add_column :camp_configurations, :reject_letter, :text
    add_column :camp_configurations, :waitlist_letter, :text
  end
end
