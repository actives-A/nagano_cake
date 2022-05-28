class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum puroduction_status: {
    stay:0,
    wait_for_start:1,
    creating:2,
    complete:3
  }


  # 小計を求めるメソッド
  def subtotal
    item.with_tax_price*quantity
  end

end
