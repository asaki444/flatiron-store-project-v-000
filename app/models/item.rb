class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def add_item_to_cart(user)
    if !user.current_cart
      user.current_cart = user.carts.create
      self.line_items.create(cart: user.current_cart)
    end
  end
end
