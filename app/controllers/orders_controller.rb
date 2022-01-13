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
      @order.line_items << item #append each item as line item in the order
      item.cart_id = nil
    end
    @order.save
    Cart.destroy session[:cart_id]
    session[:cart_id] = nil #destroy the cart and set the session back to nil
    flash[:notice] = "Your order has been received. An confirmation email will arrive shortly"
    redirect_to charges_path
  end


  def show
    @order = Order.find params[:id]
  end

  private
  def order_params
    params.require(:order).permit(:name, :email, :address, :cc_number, :cvv, :exp, :location, :state, :postcode)
  end
end
