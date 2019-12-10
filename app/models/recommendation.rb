class Recommendation < ApplicationRecord
  belongs_to :enrollment

  validates :email, presence: true, length: {maximum: 255},
                    format: {with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails"}
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :organization, presence: true
end
