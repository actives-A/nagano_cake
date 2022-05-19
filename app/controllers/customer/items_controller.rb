class Customer::ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def show
    @item=Item.find(params[:id])
  end


  def top
    @genres = Genre.all
    @item = Item.first(4)
  end

  def about
  end

end
