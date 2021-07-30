class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new order_params
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    flash[:notice] = 'Purchase successful'
    redirect_to root_path
  end


  def show
    @order = Order.find params[:id]
  end

  private
  def order_params
    params.require(:order).permit(:name, :email, :address, :cc_number, :cvv, :exp, :location, :state, :postcode)
  end
end
