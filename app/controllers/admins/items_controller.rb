class Admins::ItemsController < ApplicationController
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
	end

	private

	def item_params
		params.permit(:name , :text , :price)
	end
end
