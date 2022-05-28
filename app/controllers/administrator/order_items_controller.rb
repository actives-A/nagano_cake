class Administrator::OrderItemsController < ApplicationController

  def update
    order_item=OrderItem.find(params[:id])
    order=order_item.order
    # 注文の自動更新機能の実装
    if order_item.update(order_item_params)
      # 注文商品のステータスが1つでも製作中になった場合、注文のステータスを製作中に自動更新
      if order_item.puroduction_status=="creating"
        order.update(order_status: "in_production" )
      end
      # 注文商品のステータスが全て製作中になった場合、注文のステータスを製作中に自動更新
      # 注文に紐つく注文商品群の中に2（＝製作中）以下のステータスを持つ商品有無で判定
      if order_item.puroduction_status=="complete"
        unless order.order_items_minimum_status >=1
          order.update(order_status: "delivery_preparation")
        end
      end
      redirect_to administrator_order_path(order_item.order)
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:puroduction_status)
  end

end


