class Administrator::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.all
    @genre.save
    redirect_to administrator_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to administrator_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
