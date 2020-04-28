class AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses.all
    @address =  current_customer.addresses.new
  end

  def create
    @address = current_customer.addresses.new(address_params)
    @address.save
    redirect_to :addresses
  end

  def edit
    @addresses = current_customer.addresses.find(params[:id])
  end

  def update
    @addresses = current_customer.addresses.find(params[:id])
    if @addresses.update(address_params)
      redirect_to :addresses
    else
      render "edit"
    end
  end

  def destroy
    @addresses = current_customer.addresses.find(params[:id])
    @addresses.destroy
    redirect_to :addresses
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :postcode, :address, :ship_name)
  end
end
