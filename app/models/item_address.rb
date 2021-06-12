class ItemAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :number, :user_id, :item_id, :buy_item

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
  end

  def save
    buy_item = BuyItem.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city, prefecture_id: prefecture_id, building: building, address: address, number: number, buy_item: buy_item)
  end
end