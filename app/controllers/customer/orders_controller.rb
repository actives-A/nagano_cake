class Customer::OrdersController < ApplicationController
  before_action:authenticate_customer!
  # カートアイテムを1つ以上持っていないと注文できないようにするリダイレクト処理
  before_action:ensure_cart_item ,only:[:new,:comfirm,:create]

  def new
    @order=Order.new()
  end

  def confirm
    # binding.pry
    @order=Order.new()
    # 入力内容の充足チェック#1(支払い方法)
    if @order.cash_mean=confirm_params[:cash_mean]
      # 入力内容の充足チェック#1(お届け先)
      if send_place=confirm_params[:send_place]
        if send_place=="ご自身の住所"
          @order.postal_code=current_customer.postal_code
          @order.address=current_customer.address
          @order.send_name=current_customer.full_name
        #   binding.pry
        elsif send_place=="登録済住所から選択"
          address=current_customer.addresses.find(confirm_params[:address_id])
          @order.postal_code=address.postal_code
          @order.address=address.address
          @order.send_name=address.name
        elsif send_place=="新しいお届け先"
          # 新しいお届け先入力確認
          unless (confirm_params[:new_postal_code]=="") || (confirm_params[:new_address]=="") || (confirm_params[:new_name]=="")
            @order.postal_code=confirm_params[:new_postal_code]
            @order.address=confirm_params[:new_address]
            @order.send_name=confirm_params[:new_name]
          else
            flash[:alert] = "新しいお届け先を入力してください"
            redirect_to new_order_path
          end
        end
      else
        redirect_to new_order_path
        flash[:alert] = "支払い方法を選択してください"
      end
    else
      redirect_to new_order_path
      flash[:alert] = "お届け先を選択してください"
    end
    # 送料800円
    @order.send_money=800
    # 購入者のidを代入
    @order.customer_id=current_customer.id
    # 商品合計金額
    @total=current_customer.buynow_total
    # 請求金額の代入
    @order.total_money=@total+800
  end

  def create
    # binding.pry
    order=Order.create(create_params)
    cart_items=CartItem.where(customer_id: current_customer.id)
    cart_items.each do |cart_item|
      order_item=OrderItem.new()
      order_item.item_id=cart_item.item.id
      order_item.order_id=order.id
      order_item.quantity=cart_item.quantity
      order_item.intax_price=cart_item.item.with_tax_price
      order_item.save
      cart_item.destroy
    end
    # binding.pry
    redirect_to orders_complete_path
  end

  def complete
  end


  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
    @order.send_money=800
    # @total=current_customer.buynow_total
    # @order.total_money=@total + @order.send_money
    @total = @order.send_money + @order.total_money

  end


 private

  def confirm_params
    params.require(:order).permit(:new_send_name,:new_postal_code,:new_address,:cash_mean,:address_id,:send_place)
  end

  def create_params
    params.require(:order).permit(:customer_id,:send_name,:total_money,:cash_mean,:postal_code,:address,:order_status)
  end

  def ensure_cart_item
    # binding.pry
    unless current_customer.cart_items.count >=1
      # binding.pry
      flash[:alert]="商品をカートに入れてください"
      redirect_to cart_items_path
    end
  end
end



