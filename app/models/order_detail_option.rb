class OrderDetailOption < ApplicationRecord
  belongs_to :order_detail
  belongs_to :order_option
end
