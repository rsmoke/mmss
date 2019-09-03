class User < ApplicationRecord
  has_one :applicant_detail, dependent: :destroy, inverse_of: :user
  has_many :enrollments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable
end
