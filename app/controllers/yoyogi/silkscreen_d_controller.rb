class Yoyogi::SilkscreenDController < ApplicationController
  def index
    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where(order_technique_details: { technique_id: 8 }).distinct
                .order(:internal_delivery_date)
  end

  def wip
    @date = params[:date]
    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where(order_technique_details: { technique_id: 8 }).distinct
                .where.not(order_technique_details: { progress_id: 7 })
                .where(orders: { internal_delivery_date: @date.to_date }).distinct
                .order(:internal_delivery_date)
  end

  def done
    @date = params[:date]
    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where(order_technique_details: { technique_id: 8 }).distinct
                .where(order_technique_details: { progress_id: 7 })
                .where(orders: { internal_delivery_date: @date.to_date }).distinct
                .order(:internal_delivery_date)
  end

  def pasteup_wip
    @date = params[:date]
    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where(order_technique_details: { technique_id: 8 }).distinct
                .where.not(order_technique_details: { progress_id: [4, 5, 6, 7] })
                .where(orders: { internal_delivery_date: @date.to_date }).distinct
                .order(:internal_delivery_date)
  end

  def pasteup_done
    @date = params[:date]
    @orders = Order.left_joins(order_details: :order_technique_details).distinct
                .where(order_technique_details: { technique_id: 8 }).distinct
                .where(order_technique_details: { progress_id: [4, 5, 6, 7] })
                .where(orders: { internal_delivery_date: @date.to_date }).distinct
                .order(:internal_delivery_date)
  end
end