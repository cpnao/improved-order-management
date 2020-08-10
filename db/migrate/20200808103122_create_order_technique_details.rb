class CreateOrderTechniqueDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_technique_details do |t|
      t.references :order_detail, index: true, foreign_key: true
      t.references :technique, index: true, foreign_key: true
      t.references :progress, index: true, foreign_key: true
      t.timestamps
    end
  end
end