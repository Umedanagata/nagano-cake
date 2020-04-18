class Admins::GenresController < ApplicationController

#ジャンル一覧と新規作成
  def index
  	@genre = Genre.new
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_prams)
    genre.save
    redirect_to admins_genre_path
 # nameバリデーション
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update

  end

#ストロングパラメータ
  private
	def genre_params
		params.require(:genre).permit(:name)
	end
end
