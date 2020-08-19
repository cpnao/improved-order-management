class DomesticBuying::DoneController < ApplicationController
  def index
    @orders = Order.where(orders: { domestic_buying: 1 })
                .left_joins(:buy_details)
                .where(buy_details: { buy_progress_id: [2] }).distinct
  end
end