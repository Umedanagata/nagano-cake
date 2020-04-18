class AddGenreIdtoItems < ActiveRecord::Migration[5.2]
  def change
  	add_reference :items , :genre , foreign_key: true
  end
end
