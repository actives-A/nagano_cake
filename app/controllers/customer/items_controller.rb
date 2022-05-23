class Customer::ItemsController < ApplicationController
  def index
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
