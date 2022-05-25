class Administrator::GenresController < ApplicationController
 before_action :authenticate_administrator!
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.all
    if @genre.save
     flash[:notice] = "ジャンルを追加しました"
    redirect_to administrator_genres_path
    else
      flash[:notice] = "ジャンル名を入力してください"
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
       flash[:notice] = "ジャンルを変更しました"
       redirect_to administrator_genres_path
    else
       flash[:notice] = "ジャンル名を入力してください"
       render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
