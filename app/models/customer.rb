class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def full_name
    self.last_name + self.first_name
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
