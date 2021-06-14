class BuyItem < ApplicationRecord
  attr_accessor :token

  belongs_to :item
  has_one :address
  belongs_to :user
end
