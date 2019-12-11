class AddColumnsToFeedbacks < ActiveRecord::Migration[6.0]
  def change
    add_column :feedbacks, :type, :string, null: false
    add_column :feedbacks, :message, :string, null: false
  end
end
