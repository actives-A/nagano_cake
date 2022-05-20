class Administrator::ItemsController < ApplicationController
  def index
    @items=Item.page(params[:page])
  end

  def show
    @item=Item.find(params[:id])
  end

  def new
    @item=Item.new()
  end

  def edit
    @item=Item.find(params[:id])
  end

  def create
    # binding.pry
    @item=Item.new(item_params)
    # if params[:sales_status]=="true"
    #   @item.sales_status=true
    # else
    #   @item.sales_status=false
    # end

    if @item.save
      redirect_to  administrator_items_path
    end
  end

  def update
    item=Item.find(params[:id])
    # binding.pry
    if item.update(item_params)
      redirect_to administrator_item_path(item)
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:explanation,:genre_id,:out_tax_price,:sales_status)
  end

end
