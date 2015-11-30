class AddSlugToTypeOfs < ActiveRecord::Migration
  def change
    add_column :type_ofs, :slug, :string
  end
end
