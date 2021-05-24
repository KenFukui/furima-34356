class Item < ApplicationRecord
  has_one_attached :image

  

  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/, message: '' }, numericality: { only_integer: true,
    greater_than: 300, less_than: 10000000
    }
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :days_id
    validates :image
  end
end
