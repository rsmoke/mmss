class ChangeRecuplodLetterColumnToAllowNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :recuploads, :letter, true
  end
end
