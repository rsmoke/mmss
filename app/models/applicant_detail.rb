class ApplicantDetail < ApplicationRecord
  belongs_to :user, required: true, inverse_of: :applicant_detail

  validates :user_id, presence: true, uniqueness: { case_sensitive: false }
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :gender, presence: true
  validates :demographic, presence: true
  validates :birthdate, presence: true
  validates :diet_restrictions, presence: true
  validates :shirt_size, presence: true
  validates :address1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postalcode, presence: true
  validates :country, presence: true
  validates :phone, presence: true
  validates :parentname, presence: true
  validates :parentaddress1, presence: true
  validates :parentcity, presence: true
  validates :parentzip, presence: true
  validates :parentcountry, presence: true
  validates :parentphone, presence: true



  # def applicant_profile_link
  #   if self.find(current_user)
  #     edit_applicant_detail_path(current_user)
  #   else
  #     new_applicant_detail_path(current_user)
  #   end
  # end
end
