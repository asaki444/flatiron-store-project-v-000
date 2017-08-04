require 'pry'
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
      price.sum
  end

   def cart_checkout
    self.status = "submitted"
    update_items
  end
  
  def add_item(id)
    line_item = LineItem.find_by(item_id: id)
    if !line_item
      LineItem.new(item_id: id, quantity: 1, cart_id: self.id)
    else
      line_item.quantity += 1
      line_item
    end
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
