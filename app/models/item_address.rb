class ItemAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :number, :user_id, :item_id, :buy_item, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: ' is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :number, format: { with: /\A\d{11}\z/, message: 'is too short and is invalid. Input only number' }
    validates :user_id
    validates :item_id
  end

  def save
    buy_item = BuyItem.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city, prefecture_id: prefecture_id, building: building, address: address, number: number, buy_item: buy_item)
  end
end