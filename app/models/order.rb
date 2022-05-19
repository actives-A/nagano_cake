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


  # 注文に登録されているデータから宛名を生成する関数
  def address_display
    '〒' + postal_code.to_s + ' ' + address.to_s + ' ' + send_name.to_s
  end

  # 注文に紐つく注文商品の合計金額を算出する関数
  def payment_total
    sum=0
    order_items.each do |order_item|
      sum+=order_item.subtotal
    end
    sum
  end


end