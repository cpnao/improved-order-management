class Order < ApplicationRecord
  enum domestic_buying: { not_included: false, included: true }, _prefix: true
  enum overseas_buying: { not_included: false, included: true }, _prefix: true
  enum carry_in: { not_included: false, included: true }, _prefix: true
  enum payment_confirmation: {unconfirmed: false, confirmed: true }
  enum send_receipt: { unsent: false, sent: true }, _prefix: true
  enum send_invoice: { unsent: false, sent: true }, _prefix: true
  enum shipment_status: { not_shipped: false, shipped: true }

  belongs_to :customer
  belongs_to :order_reflect_user, class_name: "User"
  belongs_to :csr_user, class_name: "User"
  belongs_to :shipment_user, class_name: "User"
  belongs_to :order_type
  belongs_to :quote_difficulty_level
  belongs_to :payment_method
  belongs_to :specified_time

  has_many :order_details
  accepts_nested_attributes_for :order_details
end
