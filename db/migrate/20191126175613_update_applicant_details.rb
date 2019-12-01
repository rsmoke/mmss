class UpdateApplicantDetails < ActiveRecord::Migration[6.0]
  def change
    change_column :applicant_details, :gender, :string, :null => true
    change_column :applicant_details, :demographic, :string, :null => true
    change_column :applicant_details, :diet_restrictions, :string, :null => true
    change_column :applicant_details, :parentaddress1, :string, :null => true
    change_column :applicant_details, :parentcity, :string, :null => true
    change_column :applicant_details, :parentzip, :string, :null => true
    change_column :applicant_details, :parentcountry, :string, :null => true
  end
end
