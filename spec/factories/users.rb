FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { Faker::Name.name }
    family_name { Faker::Name.name }
    first_name_kana { Faker::Name.name }
    family_name_kana { Faker::Name.name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
