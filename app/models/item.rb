class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def add_item_to_cart(user)
    if !user.current_cart
      user.current_cart = user.carts.create
      self.line_items.create(cart: user.current_cart)
    end
  end
  def convert_price
      "$#{self.price.to_f/100}"
  end

  def any_left?
     self.inventory > 0
  end
end
