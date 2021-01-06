# == Schema Information
#
# Table name: campnotes
#
#  id         :bigint           not null, primary key
#  note       :string
#  opendate   :datetime
#  closedate  :datetime
#  notetype   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Campnote < ApplicationRecord
  validates :opendate, :closedate, :note, :notetype, presence: true

end
