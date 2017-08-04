require 'pry'
class LineItemsController < ApplicationController
  def create
    item = Item.find_by(id: params[:item_id])
    item.add_item_to_cart(current_user)
    line_item = LineItem.find_or_create_by(item_id: params[:item_id], cart_id: current_user.current_cart.id)
    line_item.update_quantity
    current_user.save
    redirect_to cart_path(current_user.current_cart)
  end
end
