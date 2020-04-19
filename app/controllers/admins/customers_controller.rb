class Admins::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.all
  end

  def edit
  	@customer = Customer.all
  end

  def update

  end
end