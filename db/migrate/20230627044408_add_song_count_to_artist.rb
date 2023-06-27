class AddSongCountToArtist < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :songs_count, :integer, default: 0
  end
end
