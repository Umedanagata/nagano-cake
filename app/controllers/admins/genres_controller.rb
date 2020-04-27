class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!

#ジャンル一覧と新規作成
  def index
  	@newgenre = Genre.new
    @genres = Genre.all
  end

  def create
    @genres = Genre.all
    @newgenre = Genre.new(genre_params)
    if @newgenre.save
       redirect_to admins_genres_path
    else
      render "index"
    end
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
       redirect_to admins_genres_path
    else
      render "edit"
    end
  end

#ストロングパラメータ
  private

	def genre_params
		params.require(:genre).permit(:name, :is_status)
	end
end