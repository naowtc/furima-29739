class ItemsController < ApplicationController
  # indexアクション以外のアクションが動く前にユーザーがログインしていなければルートページが表示されるようになる
  before_action :authenticate_user!, except: [:index]
  
  def index
  end

  def new
    @item = Item.new
  end
end

