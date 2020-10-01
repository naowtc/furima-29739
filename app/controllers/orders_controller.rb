class OrdersController < ApplicationController
  
  def index
    
    @item = Item.find(params[:item_id])
  end

  def create
    
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :shipment_time_id).merge(user_id: current_user.id)
  end
end
