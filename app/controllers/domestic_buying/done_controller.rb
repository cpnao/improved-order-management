class DomesticBuying::DoneController < ApplicationController
  def index
    @orders = Order.left_joins(:buy_details, :order_details).distinct
                    .where(orders: { domestic_buying: 1 }).distinct
                    .where(buy_details: { buy_type_id: 1 }).distinct
                    .where(buy_details: { buy_progress_id: 2 }).distinct
                .order(Arel.sql('internal_delivery_date IS NULL, internal_delivery_date ASC'))
                .order(Arel.sql('order_details.factory_id'))
                .order(:desired_delivery_type_id)
                .order(:order_type_id)
  end
end