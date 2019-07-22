class CreateApplicantDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :applicant_details do |t|
      t.references :user, null: false, foreign_key: true
      t.string :firstname, null: false
      t.string :middlename
      t.string :lastname, null: false
      t.string :gender, null: false
      t.boolean :us_citizen, null: false
      t.string :demographic, null: false
      t.date :birthdate, null: false
      t.text :diet_restrictions, null: false
      t.string :shirt_size, null: false
      t.string :address1, null: false
      t.string :address2
      t.string :city, null: false
      t.string :state, null: false
      t.string :state_non_us
      t.string :postalcode, null: false
      t.string :country, null: false
      t.string :phone, null: false
      t.string :parentname, null: false
      t.string :parentaddress1, null: false
      t.string :parentaddress2
      t.string :parentcity, null: false
      t.string :parentstate
      t.string :parentstate_non_us
      t.string :parentzip, null: false
      t.string :parentcountry, null: false
      t.string :parentphone, null: false
      t.string :parentworkphone
      t.string :parentemail

      t.timestamps
    end
  end
end
