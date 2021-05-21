class Item < ApplicationRecord
  has_one_attached :image

  validates :price, presence: true
end
