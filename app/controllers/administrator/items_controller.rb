class Administrator::ItemsController < ApplicationController
  before_action :authenticate_administrator!

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
    if @item.save
      redirect_to  administrator_item_path(@item)
    else
      flash[:alert]="全ての項目を入力してください"
      redirect_to new_administrator_item_path
    end
  end

  def update
    item=Item.find(params[:id])
    # binding.pry
    if item.update(item_params)
      flash[:notice] = "商品詳細を変更しました"
      redirect_to administrator_item_path(item)
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:explanation,:genre_id,:out_tax_price,:sales_status)
  end

end
