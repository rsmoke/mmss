class ChangeApplicationDetailsShirtColumn < ActiveRecord::Migration[6.0]
  def change
    change_column_null :applicant_details, :shirt_size, true
  end
end
