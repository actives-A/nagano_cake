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
    redirect_to root_path
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer =  current_customer
    if @customer.update(customer_params)
     flash[:complete]="編集を変更しました"
     redirect_to customers_path(current_customer)
    else
     render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_namber, :email)
  end


end