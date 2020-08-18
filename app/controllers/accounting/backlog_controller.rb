class Accounting::BacklogController < ApplicationController
  require "date"
  def index
    @orders = Order.left_joins(:payments).where(payments: { order_id: nil }).where.not(orders: {internal_delivery_date: nil })
    @day = Date.today
    @payment = Payment.new
  end
end