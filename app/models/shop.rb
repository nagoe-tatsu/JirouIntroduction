class Shop < ApplicationRecord
  has_one_attached :image
  attribute :new_image

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :phone, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 700 }

  before_save do
    self.image = new_image if new_image
  end
end
