class AddBuyTypeToBuyDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :buy_details, :buy_type, index: true, foreign_key: true, default: 1
  end
end
