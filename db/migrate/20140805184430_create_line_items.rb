class CreateLineItems < ActiveRecord::Migration
  def change
     create_table :line_items do |t|
      t.integer :quantity
      t.string :name
      end
  end
end
