FactoryBot.define do
  factory :item_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '224-0061' }
    city { '横浜市' }
    prefecture_id { 10 }
    building { 'ビル' }
    address { '10-10' }
    number { '09012345678' }
  end
end
