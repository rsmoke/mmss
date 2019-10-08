class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.string :email, null: false
      t.string :lastname, null: false
      t.string :firstname, null: false
      t.string :organization
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :state_non_us
      t.string :postalcode
      t.string :country
      t.string :phone_number
      t.string :best_contact_time
      t.string :submitted_recommendation
      t.datetime :date_submitted

      t.timestamps
    end
  end
end
