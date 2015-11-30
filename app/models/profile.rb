class Profile < ActiveRecord::Base
	extend FriendlyId

	belongs_to :user

 	friendly_id :name, use: :slugged

	mount_uploader :photo, PhotoUploader

	validates :name, :city, :home_number, :place_number, presence: true
	validates :home_number, :place_number, numericality: { only_integer: true }
end