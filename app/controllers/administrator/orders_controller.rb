class Administrator::OrdersController < ApplicationController
  before_action :authenticate_administrator!
  def index
    # 優先度の高い順に表示する（order_statusと注文日）
    @orders=Order.priority.page(params[:page])
  end

  def show
    @order=Order.find(params[:id])
  end

  def update
    # binding.pry
    order=Order.find(params[:id])
    if order.update(order_status_update_params)
      flash[:notice] = "注文ステータスを更新しました"
      if order.order_status=="payment_clear"
        order.order_items.each do |order_item|
          order_item.update(puroduction_status: "wait_for_start")
          flash[:notice] = "製作ステータスを更新しました"
      end
      end
      redirect_to administrator_order_path(order)
    end
  end

  def order_status
    # binding.pry
    @orders=Order.all.where(order_status: params[:order_status]).page(params[:page])
  end

  private

  def order_status_update_params
    params.require(:order).permit(:order_status)
  end
end
