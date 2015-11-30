class ChangeColumnName < ActiveRecord::Migration
  def change
  	change_table :products do |t|
  		t.rename :contition_id, :condition_id
  	end
  end
end
