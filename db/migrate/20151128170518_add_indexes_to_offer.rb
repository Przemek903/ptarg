class AddIndexesToOffer < ActiveRecord::Migration
  def change
  	add_index :offers, :product_id
  	add_index :offers, :exchanger_id
  end
end
