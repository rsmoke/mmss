class CreateRejections < ActiveRecord::Migration[6.0]
  def change
    create_table :rejections do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.text :reason

      t.timestamps
    end
  end
end
