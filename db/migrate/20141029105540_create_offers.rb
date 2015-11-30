class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :product_id
      t.integer :exchanger_id
      t.string :status
      t.datetime :created_at
      t.datetime :accepted_at

      t.timestamps
    end
  end
end
