class OrdersController < ApplicationController
  
  def index
    
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    # @orderの値が正常にデータベースに保存できるかどうかを確認しています。
    if @order.valid?
      # trueが返されたら「pay_item」が起動します。
      pay_item
      @order.save
      # falseが返されたら再度情報入力画面を表示し、入力を促すようにします。
      return redirect_to item_orders_path
    else
      # 保存後は元の購入画面にリダイレクトするようにします。（11行目）
      render 'index'
    end
  end
  



  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :shipment_time_id).merge(user_id: current_user.id)
  end

  # 今回はprice（金額）とtoken（カード情報）のみ受け取りを許可します。ここでいう「token」とは、card.jsの21行目で定義しているname属性のことです。
  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
