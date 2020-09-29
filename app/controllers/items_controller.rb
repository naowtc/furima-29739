class ItemsController < ApplicationController
  # indexアクション以外のアクションが動く前にユーザーがログインしていなければルートページが表示されるようになる
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :shipment_time_id).merge(user_id: current_user.id)
  end
end
