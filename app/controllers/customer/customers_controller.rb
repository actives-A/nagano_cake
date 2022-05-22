class Customer::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def unsubscribe
    @customer = Customer.find_by(email: params[:email])
  end

  def withdrawal
    @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to new_customer_registration_path
  end

  def edit
    @customer = current_customer
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