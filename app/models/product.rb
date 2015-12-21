class Product < ActiveRecord::Base
	extend FriendlyId

	belongs_to :condition
	belongs_to :type_of
	belongs_to :user
	has_many :offers, dependent: :destroy

 	friendly_id :name, use: [:slugged, :finders]

 	mount_uploader :photo, PhotoUploader

	validates :name, :author, :type_of_id, :condition_id, presence: true

	searchable do
		text :name, :author
	end
end
