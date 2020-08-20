class DomesticBuying::BacklogController < ApplicationController
  def index
    @orders = Order.includes(:buy_details)
                .where(buy_details: { order_id: nil })
                .where.not(orders: { internal_delivery_date: nil })
                .order(:internal_delivery_date)
  end
end