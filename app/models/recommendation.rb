class Recommendation < ApplicationRecord
  belongs_to :enrollment
  has_one :recupload, dependent: :destroy

  validates :email, presence: true, length: {maximum: 255},
                    format: {with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails"}
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :organization, presence: true


  def full_name
    "#{firstname} #{lastname}"
  end
end
