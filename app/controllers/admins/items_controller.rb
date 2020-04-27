class Admins::ItemsController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_genres, only: [:index, :new, :edit, :create,:update]

	def index
		@items = Item.page(params[:page]).per(5)
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		if @item.save
		redirect_to admins_item_path(@item)
		flash[:item_new] = "商品を新規登録しました!!"
	    else
	    	render new_admins_item_path
	    end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
		   flash[:item_update] = "商品内容を変更しました!!"
		else
			render back
		end
		redirect_to admins_item_path(@item)
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to admins_items_path
	end

	private

	def item_params
		params.require(:item).permit(:image , :name , :text , :price , :genre_id ,:is_sale )
	end

	def set_genres
		@genres = Genre.all
	end
end
