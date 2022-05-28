class Address < ApplicationRecord
  belongs_to :customer
  
  validates :postal_code,presence: true
  validates :address,presence: true
  validates :name,presence: true

  def address_display
    '〒' + postal_code.to_s + ' ' + address.to_s + ' ' + name.to_s
  end
end
