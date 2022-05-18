class Customer::OrdersController < ApplicationController
  before_action:authenticate_customer!
  def new
    @order=Order.new()
  end

  def confirm
    # binding.pry
    @order=Order.new()
    # 送料800円
    @order.send_money=800
    # カートアイテムが完了してから正しい金額を代入する記述を行う
    @order.total_money=0
    send_place=params[:send_place]
    if send_place=="ご自身の住所"
      @order.postal_code=current_customer.postal_code
      @order.address=current_customer.address
      @order.send_name=current_customer.name
    elsif send_place=="登録済住所から選択"
      address=current_customer.addresses.find_by(id: params[:address_id])
      @order.postal_code=address.postal_code
      @order.address=address.address
      @order.send_name=address.name
    elsif send_place=="新しいお届け先"
      @order.postal_code=params[:new_postal_code]
      @order.address=params[:new_address]
      @order.send_name=params[:new_name]
    end
    @total=current_customer.buynow_total
    @total_all=@total+800
  end

  def create
    
  end

  def complete
orders
  end

end
