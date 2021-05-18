FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    
    password {"123456a"}
    password_confirmation {"123456a"}
    last_name {"田中"}
    first_name {"太郎"}
    last_read {"タナカ"}
    first_read {"タロウ"}
    birthday {"1930-01-01"}
  end
end