class CreateFinancialAids < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_aids do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.integer :amount_cents
      t.string :source
      t.boolean :awarded
      t.text :note
      t.string :status

      t.timestamps
    end
  end
end
