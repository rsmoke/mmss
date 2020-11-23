class AddColumnToCampConfiguration < ActiveRecord::Migration[6.0]
  def change
    add_column :camp_configurations, :student_packet_url, :string
  end
end
