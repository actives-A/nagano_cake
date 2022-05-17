class Item < ApplicationRecord
  validates :name,presence: true
  validates :explanation,presence: true
  validates :out_tax_price,presence: true
  validates :sales_status,presence: true

  has_one_attached:image

  def get_image
    self.image.attached? ? image : 'no_image.png'
  end
  
  def with_tax_price
    (out_tax_price * 1.1).floor
  end

end
