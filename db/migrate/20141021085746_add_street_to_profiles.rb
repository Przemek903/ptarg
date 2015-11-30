class AddStreetToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :street, :string
  end
end
