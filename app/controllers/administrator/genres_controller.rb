class Administrator::GenresController < ApplicationController
 before_action :authenticate_administrator!
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.all
    unless @genre.save
      render 'error'
    end
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
