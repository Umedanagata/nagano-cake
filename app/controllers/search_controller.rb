class SearchController < ApplicationController
  def search
  	@model = params["search"]["model"]
	@content = params["search"]["content"]
	@method = params["search"]["method"]
	@records = search_for(@model,@content,@method).page(params[:page]).per(5)
  end

  private
	def search_for(model,content,method)
		if model == 'customer'
			if method == 'perfect'
				Customer.where(family_name: content)
			elsif method == 'forward'
				Customer.where('family_name LIKE ?', content+'%')
			elsif method == 'backward'
				Customer.where('family_name LIKE ?', '%'+content)
			else
				Customer.where('family_name LIKE ?', '%'+content+'%')
			end
		elsif model == 'item'
			if method == 'perfect'
				Item.where(name: content)
			elsif method == 'forward'
				Item.where('name LIKE ?', content+'%')
			elsif method == 'backward'
				Item.where('name LIKE ?', '%'+content)
			else
				Item.where('name LIKE ?', '%'+content+'%')
			end
		end
	end
end
