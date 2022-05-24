class Customer::ItemsController < ApplicationController
  def index
    @items_all_count=Item.is_sales.all.count
    @items= Item.is_sales.page(params[:page])
    @genres= Genre.all
  end

  def show
    @item=Item.find(params[:id])
    @genres = Genre.all
  end


  def top
    @genres = Genre.all
    @item = Item.first(4)
  end

  def about
  end

end
