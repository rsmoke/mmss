class AddOfferLetterTextToCampConfiguration < ActiveRecord::Migration[6.0]
  def change
    add_column :camp_configurations, :offer_letter, :text
  end
end
