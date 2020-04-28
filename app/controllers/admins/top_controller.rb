class Admins::TopController < ApplicationController
	layout 'top'
	before_action :authenticate_admin!
  def top
  	@order = Order.where("created_at >= ?", Date.today)
  end
end
