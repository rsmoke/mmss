class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, 
  # :recoverable, :rememberable, :validatable, and :omniauthable
  devise :database_authenticatable, :trackable, :timeoutable, :lockable 
end
