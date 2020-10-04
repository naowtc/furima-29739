class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, except: [:index, :create, :new]


  def index
    
    @item = Item.find(params[:item_id])
    # 出品者でないuser & 出品しているuserどちらも直接urlで購入画面に行けないようにする
    return redirect_to root_path  if current_user.id == @item.user_id || @item.order != nil

    @order = OrderShipAddress.new
    
  end

  def new
    # @order = OrderShipAddress.new
  end

  def create
    # OrderShipaddressに編集
    @item = Item.find(params[:item_id])
    
    @order = OrderShipAddress.new(order_params)
    
    # @orderの値が正常にデータベースに保存できるかどうかを確認しています。
    if @order.valid?
      
      # trueが返されたら「pay_item」が起動します。
      pay_item
      @order.save
      
      # falseが返されたら再度情報入力画面を表示し、入力を促すようにします。
      return redirect_to root_path
    else
      # 保存後はトップ画面にリダイレクトするようにします。（11行目）
      render 'index'
    end
  end
  



  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :postage_payer_id, :prefectures_id, :shipment_time_id).merge(user_id: current_user.id)
  end
  #  ログインしていないユーザーは購入ページに遷移しようとすると、ログインページに遷移
  def move_to_index
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  # itemとtoken（カード情報）address,ネストしたuser情報の受け取りを許可します。ここでいう「token」とは、card.jsの21行目で定義しているname属性のことです。pictw参照
  def order_params
    params.permit(:token,  :item_id, :post_code, :prefectures_id, :city, :house_number, :phone_number, :building_name ).merge(user_id: current_user.id)
  end

  def pay_item
    
    Payjp.api_key = "sk_test_ed24542cb960b6c4b759b0e5" # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  

end
