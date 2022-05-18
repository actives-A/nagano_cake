class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def unsubscribe
    @customer = Customer.find_by(email: params[:email])
  end

  def withdrawal
    @customer = Customer.find_by(email: params[:email])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer =  Customer.find(params[:id])
    if @customer.update(customer_params)
     flash[:complete]="編集を変更しました"
     redirect_to customer_path(@customer.id)
    else
     render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_namber, :email)
  end


end