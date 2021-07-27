class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create item_params
    @current_user.items << item
    if params[:item][:image].present?
      req = Cloudinary::Uploader.upload params[:item][:image]
      item.image = req["public_id"]
      item.save
    end
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

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :size, :condition, :color, :shipping, :style, :name, :price, :description)
  end
end
