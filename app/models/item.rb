class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipment_time
  
  #空の投稿を保存できないようにする
  with_options presence: true do
  validates :image
  validates :name
  validates :description 
  validates :category
  validates :condition
  validates :postage_payer
  validates :prefecture 
  validates :shipment_time
  validates :price
end
# 金額範囲に関するバリデーション
validates :price , numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, with: /\A[0-9]+\z/}
  #選択が「--」のままになっていないか
  validates :category_id, :condition_id, :postage_payer_id, :prefecture_id, :prefecture_id, :shipment_time_id,numericality: { other_than: 0 }

end
