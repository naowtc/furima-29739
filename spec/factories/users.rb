FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { 'aBct12345' }
    password_confirmation { password }
    first_name { 'た田タ' }

    last_name  { 'た田タ' }

    first_name_kana { 'タ' }
    last_name_kana { 'タ' }
    birth_date { 19_950_909}
  end
end
