class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :ship_address

  # attr_accessor :token
  # validates :user_id,:item_id, presence: true
  # validates :token, presence: true
end
