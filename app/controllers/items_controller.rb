class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create item_params
    redirect_to item
  end

  def edit
    @item = Item.find params[:id]
  end

  def update
    item = Item.find params[:id]
    item.update item_params
    redirect_to item
  end

  def show
    @item = Item.find params[:id]
    @user = @item.user
  end

  private
  def item_params
    params.require(:item).permit(:image, :size, :condition, :color, :shipping, :style, :name, :price, :description)
  end
end
