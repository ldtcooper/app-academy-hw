class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    songs_per_album = self.albums.includes(:tracks)
    song_count = {}
    songs_per_album.each do |album|
      song_count[album.title] = album.tracks.length
    end
    song_count
  end
end
