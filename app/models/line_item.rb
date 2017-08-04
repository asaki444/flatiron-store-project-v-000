class LineItem < ActiveRecord::Base
 belongs_to :item
 belongs_to :cart

    def update_quantity
       !self.quantity ? self.quantity = 1 : self.quantity+=1
       self.save
    end
end
