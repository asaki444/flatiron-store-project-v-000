
class CartsController < ApplicationController
 before_filter :authenticate_user!
    def checkout
        cart = Cart.find_by(id: params[:id])
        cart.cart_checkout
        current_user.current_cart = false
        current_user.save
        redirect_to cart_path(cart)
    end

    def show
    end
end
