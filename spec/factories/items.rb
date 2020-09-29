FactoryBot.define do
  factory :item do
    
    name {'商品1'}
    description {'商品1のringoです'}
    category_id {2}
    condition_id {2}
    postage_payer_id {2}
    prefecture_id {2}
    shipment_time_id {2}
    price {3000}
    
    association :user
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
