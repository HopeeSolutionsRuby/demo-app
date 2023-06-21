class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|

      t.string :name 
      t.integer :artist_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
