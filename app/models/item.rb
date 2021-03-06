class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :fee
  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :days

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { only_integer: true,
                                      greater_than: 299, less_than: 10_000_000, message: 'is out of setting range' }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :days_id
  end
end
