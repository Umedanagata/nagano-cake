class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!

#ジャンル一覧と新規作成
  def index
  	@newgenre = Genre.new
    @genres = Genre.all
  end

  def create
    @newgenre = Genre.new(genre_params)
    @newgenre.save
    redirect_to admins_genres_path
 # nameバリデーション入れる
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admins_genres_path
  end

#ストロングパラメータ
  private

	def genre_params
		params.require(:genre).permit(:name, :is_status)
	end
end
