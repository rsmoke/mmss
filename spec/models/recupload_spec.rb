# == Schema Information
#
# Table name: recuploads
#
#  id                :bigint           not null, primary key
#  letter            :text
#  authorname        :string           not null
#  studentname       :string           not null
#  recommendation_id :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'rails_helper'

RSpec.describe Recupload, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
