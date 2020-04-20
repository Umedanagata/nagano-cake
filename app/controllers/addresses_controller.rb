class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address =  Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to edit_address_path(@address.id)
    else
      render "index"
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @addres.update(address_params)
      redirect_to @address
    else
      render "edit"
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :postcode, :address, :ship_name)
  end
end
