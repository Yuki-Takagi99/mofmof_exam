class Property < ApplicationRecord
  validates :property_name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :rental_price, presence: true
  validates :address, presence: true, length: { maximum: 50 }
  validates :age, presence: true
  validates :note, presence: true, length: { maximum: 255 }
end
