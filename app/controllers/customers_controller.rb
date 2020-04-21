class CustomersController < ApplicationController
  before_action :authenticate_user!
  def confirm
  end

  def create
  end

  def show
    @custmer = Custmer.find(params[:id])
  end

  def edit
  end

  def update
  end

private
  def customer
    params.require(:castomer).permit(:family_name, :last_name, :family_name_kana, :last_name_kana, :postcode, :adress, :phone_namber, :email)
  end
end
