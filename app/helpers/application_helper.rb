module ApplicationHelper

  def my_offers(offer)
    if Product.find(offer.product_id).user == current_user and offer.status == 'oczekujace'
      linkPhoto(offer)
    end
  end

  def incoming_offers(offer)
    if Product.find(offer.exchanger_id).user == current_user and offer.status == 'oczekujace'
      linkPhoto(offer)
    end
  end

  def accepted_offers(offer)
    if Product.find(offer.product_id).user == current_user and offer.status == 'zaakceptowany'
      linkPhoto(offer)
    end
  end

  private

    def linkPhoto(offer)
      link_to(image_tag(offer.exchanger.photo.url, :width => "150", :height => "125", :class => "img-rounded"),
        product_offer_path(offer.product_id, offer.id))
    end
end