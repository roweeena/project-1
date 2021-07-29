class LineItemsController < ApplicationController

  def create
    #find the associated item and current cart
    chosen_item = Item.find(params[:item_id])
    current_cart = @current_cart
    @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.item = chosen_item
      # Save and redirect to cart show path
    @line_item.save
    redirect_to cart_path(current_cart)
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

private
  def line_item_params
    params.require(:line_item).permit(:item_id, :cart_id)
  end
end
