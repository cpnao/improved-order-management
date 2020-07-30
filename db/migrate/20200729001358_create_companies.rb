class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.text :company_name
      t.text :company_name_furigana
      t.references :payment_method, index: true, foreign_key: true
      t.integer :receipt_required, null: false, default: 0
      t.timestamps
    end
  end
end
