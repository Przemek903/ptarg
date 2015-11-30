class ProfilesController < ApplicationController
	before_action :set_profile, only: [:show, :edit, :update]
	before_filter :authenticate_user!

	def new
		@profile = Profile.new
	end

	def show
	end

	def edit
	end

	def update
	    respond_to do |format|
	      if @profile.update(profile_params)
	        format.html { redirect_to @profile, notice: 'Product was successfully updated.' }
	        format.json { render :show, status: :ok, location: @profile }
	      else
	        format.html { render :edit }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def create
		@profile = Profile.new(profile_params)

	    respond_to do |format|
	      if @profile.save
	        format.html { redirect_to root_path }
	      else
	        format.html { render :new }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private

		def set_profile
			@profile = Profile.friendly.find(params[:id])
		end

		def profile_params
			params.require(:profile).permit(:name, :surname, :city, :street, :home_number, :place_number,
											:user_id, :photo, :photo_cache)
		end

end