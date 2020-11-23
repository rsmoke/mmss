# == Schema Information
#
# Table name: recommendations
#
#  id                       :bigint           not null, primary key
#  enrollment_id            :bigint           not null
#  email                    :string           not null
#  lastname                 :string           not null
#  firstname                :string           not null
#  organization             :string
#  address1                 :string
#  address2                 :string
#  city                     :string
#  state                    :string
#  state_non_us             :string
#  postalcode               :string
#  country                  :string
#  phone_number             :string
#  best_contact_time        :string
#  submitted_recommendation :string
#  date_submitted           :datetime
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
