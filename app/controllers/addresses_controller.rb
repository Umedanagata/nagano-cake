class AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses.all
    @address =  current_customer.addresses.new
  end

  def create
    @address = current_customer.addresses.new(address_params)
    if @address.save
      redirect_to addresses_path
    else
      render "index"
    end
  end

  def edit
    @address = current_customer.addresses.find(params[:id])
  end

  def update
    @address = current_customer.addresses.find(params[:id])
    if @addres.update(address_params)
      redirect_to @address
    else
      render "edit"
    end
  end

  def destroy
    @address = current_customer.address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :postcode, :address, :ship_name)
  end
end
