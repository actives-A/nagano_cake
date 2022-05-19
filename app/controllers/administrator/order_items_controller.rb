class Administrator::OrderItemsController < ApplicationController

  def update
    order_item=OrderItem.find(params[:id])
    order_item.update(order_item_params)
    redirect_to administrator_order_path(order_item.order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:puroduction_status)
  end

end


