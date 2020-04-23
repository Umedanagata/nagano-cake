class CustomersController < ApplicationController

  # before_action :authenticate_user!
  def confirm
    @customer = current_customer
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

  def destroy
    @customers = current_customer
    @customers.destroy
    @customers.is_active = false
    redirect_to root_path
  end


private
  def customer_params
    params.require(:customer).permit(:family_name, :last_name, :family_name_kana, :last_name_kana, :postcode, :address, :phone_number, :email)
  end
end