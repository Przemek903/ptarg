class TypeOfController < ApplicationController
  def show
  	@typeOf = TypeOf.find_by_id(params[:id])
  	@products = Product.friendly.where("type_of_id = ?", params[:id])
  end
end
