class AddColumnToEnrollment < ActiveRecord::Migration[6.0]
  def change
    add_column :enrollments, :campyear, :integer
  end
end
