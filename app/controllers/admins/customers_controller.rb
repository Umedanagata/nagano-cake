class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.with_deleted.page(params[:page]).per(5)
  end

  def show
    @customer = Customer.with_deleted.find(params[:id])
  end

  def edit
  	@customer = Customer.with_deleted.find(params[:id])
  end

  def update
    if params[:is_active] == "true"
       @customer = Customer.with_deleted.find(params[:id])
       @customer.restore
       redirect_to admins_customer_path(@customer)
    else
      @customer = Customer.find(params[:id])
      @customer.destroy
      redirect_to admins_customer_path(@customer)
    end
  end


  private

  def customer_params
    params.require(:customer).permit(:family_name, :last_name, :family_name_kana, :last_name_kana,
     :postcode, :address, :phone_number, :email, :is_active)
  end
end