class Administrator::OrdersController < ApplicationController
  def index
    @orders=Order.all
  end

  def show
    @order=Order.find(params[:id])
  end

  def update
    # binding.pry
    order=Order.find(params[:id])
    if order.update(order_status_update_params)
      redirect_to administrator_order_path(order)
    end
  end

  private

  def order_status_update_params
    params.require(:order).permit(:order_status)
  end
end
