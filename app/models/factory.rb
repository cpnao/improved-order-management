class Factory < ApplicationRecord
  has_many :users_factories
  has_many :users, through: :users_factories
  # has_many :order_details
end
