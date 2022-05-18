class Customer::CartItemsController < ApplicationController
  def index
    @cart_items =  current_customer.cart_items.all
    @sum = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if curt_item = current_customer.cart_items.find_by(item_id: params[:cart_itm][:item_id])
       cart_item.number += params[:cart_item][:number].to_i cart_item.save
      flash[:notice] = "カートに商品を追加しました"
      redirect_to cart_items_path
    elsif @cart_item.save
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

  def destroy_all
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