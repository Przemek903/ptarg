class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :contition_id
      t.text :description
      t.string :author
      t.integer :type_of_id
      t.string :photo

      t.timestamps
    end
  end
end
