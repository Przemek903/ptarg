class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :surname
      t.string :city
      t.integer :home_number
      t.integer :place_number
      t.integer :user_id
      t.string :photo

      t.timestamps
    end
  end
end
