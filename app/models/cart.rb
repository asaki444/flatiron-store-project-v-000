class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  attr_accessor :status
  def total
    price = []
    self.line_items.each do |line_items|
       price << line_items.item.price * line_items.quantity
    end
      price.sum.to_f/100
  end

   def cart_checkout
    self.status = "submitted"
    update_items
  end

  def update_items
    if self.status == "submitted"
    self.line_items.each do |line_item|
            item = Item.find_by(id: line_item.item_id) 
            item.inventory = item.inventory - line_item.quantity.to_i
            item.save
      end
    end   
  end 
end
