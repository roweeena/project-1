class ChargesController < ApplicationController

  def index
  end

  def new
  end

  def create

  Cart.destroy session[:cart_id]
  session[:cart_id] = nil #destroy the cart and set the session back to nil
  flash[:notice] = "Your order has been received. An confirmation email will arrive shortly"
  redirect_to charges_path
  @amount = 500

  customer = Stripe::Customer.create(
    email: params[:stripeEmail],
    source: params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
  end
end
