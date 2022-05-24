class Item < ApplicationRecord
  validates :name,presence: true
  validates :explanation,presence: true
  validates :out_tax_price,presence: true
  validates :sales_status,presence: true

  has_one_attached:image
  has_many :order_items
  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  # 販売ステータス(sales_status)の設定
  enum sales_status:{
    on_sales: true,
    stop_sales: false
  }

  # イメージが登録されなかった場合、デフォルトの画像をアタッチする
  def get_image
    self.image.attached? ? image : 'no_image.png'
  end

  # 税抜き価格から税込価格を生成する関数
  def with_tax_price
    (out_tax_price * 1.1).floor
  end

end
