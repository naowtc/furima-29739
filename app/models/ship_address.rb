class ShipAddress < ApplicationRecord
  belongs_to :order

  # with_options presence: true do
  #   validates :post_code
  #   validates :prefectures_id
  #   validates :city
  #   validates :house_number
  #   validates :phone_number
  #   validates :order_id
  # end
end
