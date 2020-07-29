class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :customer_name
      t.string :customer_furigana
      t.references :customer_type, index: true, foreign_key: true
      t.references :payment_method, index: true, foreign_key: true
      t.references :receipt_required, index: true, foreign_key: true
      t.timestamps
    end
  end
end