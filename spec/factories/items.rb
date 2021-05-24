FactoryBot.define do
  factory :item do
    name { 'test' }
    description { 'test' }
    price { 301 }
    category_id { 2 }
    condition_id { 2 }
    fee_id { 2 }
    prefecture_id { 2 }
    days_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
