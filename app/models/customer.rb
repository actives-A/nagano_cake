class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  # 会員がカートに入れたアイテムの合計金額を算出する関数
  def buynow_total
    sum=0
    cart_items.each do |cart_item|
      sum+=cart_item.subtotal
    end
    sum
  end

   # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  # 苗字と名前を合体する関数
  def full_name
    self.last_name.to_s + ' ' + self.first_name.to_s
  end
end
