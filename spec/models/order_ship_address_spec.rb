require 'rails_helper'

RSpec.describe OrderShipAddress, type: :model do
  describe '#save' do
    before do
      @order_ship_address = FactoryBot.build(:order_ship_address)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_ship_address).to be_valid
    end

    it 'post_codeが空だと保存できないこと' do
      @order_ship_address.post_code = nil
      @order_ship_address.valid?
      expect(@order_ship_address.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_ship_address.post_code = '1234567'
      @order_ship_address.valid?
      expect(@order_ship_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end

    it 'prefectures_idが空だと保存できないこと' do
      @order_ship_address.prefectures_id = nil
      @order_ship_address.valid?
      expect(@order_ship_address.errors.full_messages).to include("Prefectures can't be blank")
    end

    it 'cityが空だと保存できないこと' do
      @order_ship_address.city = nil
      @order_ship_address.valid?
      expect(@order_ship_address.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberは空だと保存できないこと' do
      @order_ship_address.house_number = nil
      @order_ship_address.valid?
      expect(@order_ship_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberは空だと保存できないこと' do
      @order_ship_address.phone_number = nil
      @order_ship_address.valid?
      expect(@order_ship_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberはハイフンは不要で、11桁以内でないと保存できないこと' do
      @order_ship_address.phone_number = '1234567899-9'
      @order_ship_address.valid?
      expect(@order_ship_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'building_nameは空でも保存できること' do
      @order_ship_address.building_name = nil
      expect(@order_ship_address).to be_valid
    end

    it 'tokenが空だと保存できないこと' do
      @order_ship_address.token = nil
      @order_ship_address.valid?
      expect(@order_ship_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが紐づいてないと保存できないこと' do
      @order_ship_address.user_id = nil
      @order_ship_address.valid?
      expect(@order_ship_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが紐づいてないと保存できないこと' do
      @order_ship_address.item_id = nil
      @order_ship_address.valid?
      expect(@order_ship_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
