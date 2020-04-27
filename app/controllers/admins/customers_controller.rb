class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page]).per(5)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if  @customer.update(customer_params)
        redirect_to admins_customer_path
    else
        render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name, :last_name, :family_name_kana, :last_name_kana,
     :postcode, :address, :phone_number, :email, :is_active)
  end
end