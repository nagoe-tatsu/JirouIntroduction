class Shop < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  has_one_attached :image
  attribute :new_image

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :phone, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 700 }

  scope :find_newest_shops, -> (p) { page(p).per(4).order(publish_date: :desc) }

  before_save do
    if new_image
      self.image = new_image 
    end
  end
end
