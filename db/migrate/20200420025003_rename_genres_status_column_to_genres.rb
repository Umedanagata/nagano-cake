class RenameGenresStatusColumnToGenres < ActiveRecord::Migration[5.2]
  def change
  	rename_column :genres, :genres_status, :is_status
  end
end
