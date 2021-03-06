class Order < ApplicationRecord
  after_initialize :set_default_values

  def to_param
    uid
  end

  enum change_delivery_date: { no_change: false, change: true }
  enum domestic_buying: { not_included: false, included: true }, _prefix: true
  enum overseas_buying: { not_included: false, included: true }, _prefix: true
  enum carry_in: { not_included: false, included: true }, _prefix: true
  enum payment_confirmation: {unconfirmed: false, confirmed: true }
  enum send_receipt: { unsent: false, sent: true }, _prefix: true
  enum send_invoice: { unsent: false, sent: true }, _prefix: true

  belongs_to :customer
  belongs_to :order_reflect_user, class_name: "User"
  belongs_to :representative_user, class_name: "User"
  belongs_to :order_type
  belongs_to :quote_difficulty_level
  belongs_to :payment_method
  belongs_to :specified_time

  has_many :order_details, dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :order_details, reject_if: :all_blank, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture_code
  has_many :order_addresses
  has_many :customer_addresses, through: :order_addresses, dependent: :destroy
  accepts_nested_attributes_for :customer_addresses, reject_if: :all_blank, allow_destroy: true

  has_many :payments, dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :payments, reject_if: :all_blank, allow_destroy: true

  has_many :shipments, dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :shipments, reject_if: :all_blank, allow_destroy: true

  has_many :order_notes, dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :order_notes, reject_if: :all_blank, allow_destroy: true

  has_many :buy_details, dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :buy_details, reject_if: :all_blank, allow_destroy: true

  private

  def set_default_values
    self.uid ||= loop do
      uid = 'CP' + [*0..9, *'A'..'Z'].sample(14)*''
      break uid unless self.class.exists?(uid: uid)
    end
  end
end
