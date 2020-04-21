class CustomersController < ApplicationController

  
  def confirm
  end

  def create
  end

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      render "edit"
    end
  end

private
  def customer_params
    params.require(:customer).permit(:family_name, :last_name, :family_name_kana, :last_name_kana, :postcode, :address, :phone_number, :email)
  end

private
  def customer
    params.require(:castomer).permit(:family_name, :last_name, :family_name_kana, :last_name_kana, :postcode, :adress, :phone_namber, :email)
  end
end
