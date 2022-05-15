class Item < ApplicationRecord
  validates :name,presence: true
  validates :explanation,presence: true
  validates :out_tax_price,presence: true
  validates :sales_status,presence: true

  has_one_attached:image

end
