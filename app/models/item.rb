class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture_id
  belongs_to_active_hash :shipment_time
  
  #空の投稿を保存できないようにする
  validates :name, :description, :price, :category, :condition, :postage_payer, :prefecture, :shipment_time, presence: true

  #選択が「--」のままになっていないか
  validates :category_id, :condition_id, :postage_payer_id, :prefecture_id, :prefecture_id, :shipment_time_id,numericality: { other_than: 0 }

end
