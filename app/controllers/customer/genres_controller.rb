class Customer::GenresController < ApplicationController
  def show
    @genres=Genre.all
    @genre=Genre.find(params[:id])
    @items_all_count=@genre.items.is_sales.all.count
    @items=@genre.items.is_sales.page(params[:page])
  end
end
