FactoryBot.define do
  factory :order_ship_address do
    post_code { '123-4567' }
    prefectures_id { 2 }
    city { '京都市' }
    house_number { '1-1-2' }
    # building_name { '京都ハイツ' }
    phone_number { '09012345678' }
    # order_id { 2 }
    user_id { 4 }
    item_id { 4 }
    token {'12345678'}
  end
end
    
    




   

    