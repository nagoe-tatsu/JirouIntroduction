class Shop < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :phone, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 1000 }
end
