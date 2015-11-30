class AddIndexesToProduct < ActiveRecord::Migration
  def change
  	add_index :products, :condition_id
  	add_index :products, :type_of_id
  	add_index :products, :user_id  	
  end
end
