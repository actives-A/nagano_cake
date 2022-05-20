class Customer::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
   @address = Address.new(address_params)
   @address.customer_id = current_customer.id
    if @address.save
      flash[:complete]="新規配送先を登録しました"
      redirect_to addresses_path
    else
      @address = Address.all
      render :index
    end
  end


   def destroy
   @address =  Address.find(params[:id])
   @address.destroy
   redirect_to addresses_path
   end

   def update
    @address =  Address.find(params[:id])
    if @address.update(address_params)
     flash[:complete]="配送先を変更しました"
     redirect_to addresses_path
    else
     render :edit
    end
   end


  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end

