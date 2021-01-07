class CreateCampnotes < ActiveRecord::Migration[6.0]
  def change
    create_table :campnotes do |t|
      t.string :note
      t.datetime :opendate
      t.datetime :closedate
      t.string :notetype

      t.timestamps
    end
  end
end
