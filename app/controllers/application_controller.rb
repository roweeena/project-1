class ApplicationController < ActionController::Base
  before_action :fetch_user
  before_action :current_cart

private
def fetch_user
  @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
  session[:user_id] = nil unless @current_user.present? # Log out non-existent users.
end

def check_for_login
  unless @current_user.present?
    flash[:error] = "You must be logged in"
    redirect_to login_path
  end
end

def check_for_admin
  redirect_to login_path unless (@current_user.present? && @current_user.admin?)
  end


  def current_cart
      if session[:cart_id] #If a session[:cart_id] already exists then find the Cart with that id, if there is no cart with that id then set the session id to nil.
        cart = Cart.find_by :id => session[:cart_id]
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end
      if session[:cart_id] == nil
        # If there is no session[:cart_id] associated with this user then create a new cart and store it in the users session id
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end

      end

    end
