class ItemsController < ApplicationController
  # indexアクション以外のアクションが動く前にユーザーがログインしていなければルートページが表示されるようになる。exceptで特定のアクションを許可する
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
 
  def index
    @items = Item.all
    @items = Item.includes(:user).order('created_at DESC')
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

  # itemsコントローラーにshowアクションを定義。editアクションでは編集したいレコードを@itemに代入し、ビューに受け渡すことで編集画面で利用できる
  def show
    
  end

  def edit
    # itemsコントローラーにeditアクションを定義。editアクションでは編集したいレコードを@itemに代入し、ビューに受け渡すことで編集画面で利用できる
    
  end

  #  itemsコントローラーにupdateアクションを定義。正常に編集が完了した時とそうでない時で条件分岐
  def update
    
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  #  before_action で@item = Item.find(params[:id])をまとめる
  def set_item
     @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :shipment_time_id).merge(user_id: current_user.id)
  end
end
