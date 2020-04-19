class Admins::ItemsController < ApplicationController

	before_action :set_genres, only: [:index, :new, :edit, :create,:update]

	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		@item.save
		redirect_to admins_item_path(@item)
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		@item.update(item_params)
		redirect_to admins_item_path(@item)
	end

	private

	def item_params

		params.require(:item).permit(:image , :name , :text , :price , :genre_id )
	end

	def set_genres
		@genres = Genre.all
	end
end
