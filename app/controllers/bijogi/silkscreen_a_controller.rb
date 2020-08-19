class Bijogi::SilkscreenAController < ApplicationController
  def index
    @orders = Order.left_joins(order_details: :order_technique_details)
                .where(order_details: { factory_id: 8 })
                .where(order_technique_details: { technique_id: 1 })
                .order(:internal_delivery_date)
  end
end