class User < ApplicationRecord
  has_one :applicant_detail, dependent: :destroy, inverse_of: :user
  has_many :enrollments, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable


  def total_paid
    payments.pluck(:total_amount).map{ |v| v.to_f }.sum / 100
  end

  def display_name
    self.email # or whatever column you want
  end
end
