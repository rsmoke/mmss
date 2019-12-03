class RemoveShirtSizeFromEnrollment < ActiveRecord::Migration[6.0]
  def change
    remove_column :enrollments, :shirt_size
  end
end
