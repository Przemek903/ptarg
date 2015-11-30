class CreateTypeOfs < ActiveRecord::Migration
  def change
    create_table :type_ofs do |t|
      t.string :name

      t.timestamps
    end
  end
end
