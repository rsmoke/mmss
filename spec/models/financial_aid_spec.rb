# == Schema Information
#
# Table name: financial_aids
#
#  id            :bigint           not null, primary key
#  enrollment_id :bigint           not null
#  amount_cents  :integer
#  source        :string
#  awarded       :boolean          default(FALSE)
#  note          :text
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe FinancialAid, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
