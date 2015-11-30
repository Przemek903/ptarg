class OffersController < ApplicationController
  before_filter :setup_products, only: [:index, :show]
  before_filter :authenticate_user!

   # def create
     # Offer.request(@product, @exchanger)
     # redirect_to root_path
   # end

  def index
    Offer.request(@prod, @exchanger)
    #UserMailer.offer_email(current_user).deliver
    redirect_to root_path
  end

  def view
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
    @offerProduct = Product.find(@offer.product_id)
    @offerExchanger = Product.find(@offer.exchanger_id)
  end

  def accept
    offer = Offer.find(params[:id])
    Offer.accept(Product.find(offer.product_id), Product.find(offer.exchanger_id))
    flash[:success] = "Oferta zaakceptowana"
    redirect_to view_path
  end

  def breakup
    offer = Offer.find(params[:id])
    Offer.breakup(Product.find(offer.product_id), Product.find(offer.exchanger_id))
    flash[:success] = "Oferta usunieta"
    redirect_to view_path
  end

  private

	  def setup_products
	    @prod = Product.find(params[:product_id])
	    @exchanger = Product.find_by_id(params[:id])
	  end
end