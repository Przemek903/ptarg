class HomeController < ApplicationController
	before_filter :authenticate_user!, only: :index
  def index
  	@products = Product.order("id DESC").first(3)
  	@userPruoducts = current_user.products.order("id DESC").first(3)
  end

  def contact
  	
  end

  def help
  	
  end

end
