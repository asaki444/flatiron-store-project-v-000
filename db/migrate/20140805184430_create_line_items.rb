class CreateLineItems < ActiveRecord::Migration
  def change
     create_table :items do |t|
      t.string :quantity
      t.string :name
      end
  end
end
