class Admins::GenresController < ApplicationController
	def index

	end

	def show

	end

	def create

	end

	def edit

	end

	def update

	end


	private
	def genre_params
		params.permit(:name , :genres_status)
	end
end
