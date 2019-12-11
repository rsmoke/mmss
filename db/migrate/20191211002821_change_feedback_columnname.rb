class ChangeFeedbackColumnname < ActiveRecord::Migration[6.0]
  def change
    rename_column :feedbacks, :type, :genre
  end
end
