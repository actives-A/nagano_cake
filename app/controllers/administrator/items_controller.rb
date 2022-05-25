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
      #flash[:alert]="全ての項目を入力してください"
      render  new_administrator_item_path
    end
  end

  def search_items
    
    @item_name=params[:query]
    @items=Item.all.where("name LIKE ?", "%#{@item_name}%").page(params[:page])
    @items_all_count=Item.all.where("name LIKE ?", "%#{@item_name}%").count
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
