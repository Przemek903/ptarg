class Offer < ActiveRecord::Base
	belongs_to :product

  	belongs_to :exchanger, class_name: "Product", foreign_key: "exchanger_id"

  	validates :product_id, :exchanger_id, presence: true

	  def self.exists?(product, exchanger)
	    not find_by_product_id_and_exchanger_id(product, exchanger).nil?
	  end

	  def self.request(product, exchanger)
	    unless product == exchanger or Offer.exists?(product, exchanger)
	      transaction do
	        create(product: product, exchanger: exchanger, status: "oferta")
	        create(product: exchanger, exchanger: product, status: "oczekujace")
	      end
	    end
	  end

	  # accept offer
	  def self.accept(product, exchanger)
	    transaction do
	      accepted_at = Time.now
	      accept_one_side(product, exchanger, accepted_at)
	      accept_one_side(exchanger, product, accepted_at)
	    end
	  end

	  # delete offer
	  def self.breakup(product, exchanger)
	    transaction do
	      destroy(find_by_product_id_and_exchanger_id(product, exchanger))
	      destroy(find_by_product_id_and_exchanger_id(exchanger, product))
	    end
	  end

	  private
	  # accept one side off offer
		  def self.accept_one_side(product, exchanger, accepted_at)
		    request = find_by_product_id_and_exchanger_id(product, exchanger)
		    request.status = "zaakceptowany"
		    request.accepted_at = accepted_at
		    request.save!
		  end
end