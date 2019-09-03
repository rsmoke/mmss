class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :international, null: false, default: false
      t.string :high_school_name, null: false
      t.string :high_school_address1, null: false
      t.string :high_school_address2
      t.string :high_school_city, null: false
      t.string :high_school_state
      t.string :high_school_non_us
      t.string :high_school_postalcode
      t.string :high_school_country, null: false
      t.string :year_in_school, null: false
      t.string :anticipated_graduation_year, null: false
      t.string :room_mate_request
      t.text :personal_statement, null: false
      t.string :shirt_size
      t.text :notes
      t.string :application_status
      t.string :offer_status
      t.string :partner_program

      t.timestamps
    end
  end
end
