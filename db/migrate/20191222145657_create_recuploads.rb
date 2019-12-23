class CreateRecuploads < ActiveRecord::Migration[6.0]
  def change
    create_table :recuploads do |t|
      t.text :letter, null: false
      t.string :authorname, null: false
      t.string :studentname, null: false
      t.references :recommendation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
