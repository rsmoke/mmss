class AddDateColumnToEnrollment < ActiveRecord::Migration[6.0]
  def change
    add_column :enrollments, :application_deadline, :date
  end
end
