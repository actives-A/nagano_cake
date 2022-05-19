class Order < ApplicationRecord
  enum cash_mean:{
    credit_card:0,
    transfer:1
  }

  enum order_status:{
    payment_waiting:0,
    payment_clear:1,
    in_production:2,
    delivery_preparation:3,
    delivery_complete:4
  }

  has_many :order_items
  belongs_to :customer
end