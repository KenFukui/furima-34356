class ItemAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :number, :user_id, :item_id

  # validates:

  def save
    Address.create(postal_code: postal_code, city: city, prefecture_id: prefecture_id, building: building, address: address, number: number)
    BuyItem.create(user_id: user_id, item_id: item_id)
  end
end