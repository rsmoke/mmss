# == Schema Information
#
# Table name: demographics
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Demographic, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
