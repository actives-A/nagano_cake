class Customer::CartItemsController < ApplicationController
  def index
    @cart_items =  current_customer.cart_items.all
    # binding.pry
    @sum = 0
  end

  def create
    # binding.pry
    @cart_item = CartItem.new(cart_item_params)
    if cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      # binding.pry
       cart_item.quantity += params[:cart_item][:quantity].to_i
       cart_item.save
      flash[:notice] = "カートに商品を追加しました"
      redirect_to cart_items_path
    elsif
     @cart_item.customer_id=current_customer.id
     @cart_item.save
     flash[:notice] = "カートに商品を追加しました"
     redirect_to cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    flash[:notice] = "個数を変更しました"
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:complete]="カートを空にしました"
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end

end