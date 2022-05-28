class Order < ApplicationRecord
  # 支払方法のステータス（cash_mean）の設定
  enum cash_mean:{
    credit_card:0,
    transfer:1
  }

  # 注文ステータス（order_status）の設定
  enum order_status:{
    payment_waiting:0,
    payment_clear:1,
    in_production:2,
    delivery_preparation:3,
    delivery_complete:4
  }

  has_many :order_items, dependent: :destroy
  belongs_to :customer

  # 管理者の注文一覧の並べ替え機能に利用
  scope :priority, -> { order(order_status: :asc,created_at: :asc) }

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

  # 注文の全商品数を算出する関数
  def count_total
    sum=0
    order_items.each do |order_item|
      sum+=order_item.quantity
    end
    sum
  end

  # 注文に紐つく注文商品群の中から製作中より低いステータス注文商品を取得
  def order_items_minimum_status
    order_items.where("puroduction_status < 3").count
  end
end