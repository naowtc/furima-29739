class OrderShipAddress

  include ActiveModel::Model
  attr_accessor  :post_code, :prefectures_id, :city, :house_number, :building_name, :phone_number,  :token, :user_id,:item_id

    # orderモデルのバリデーションを移行
    validates :user_id,:item_id, presence: true
    validates :token, presence: true

    # ship_addressモデルのバリデーションを移行
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures_id
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/}
    
  end


    def save
      # ユーザーとアイテムの情報を保存し、「order」という変数に入れている
      order = Order.create(user_id: user_id, item_id: item_id)
      # 住所の情報を保存
      ShipAddress.create(post_code: post_code, prefectures_id: prefectures_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
      
    end
  
end