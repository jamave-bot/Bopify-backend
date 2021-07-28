class SongSerializer < ActiveModel::Serializer
  attributes :id, :song_link, :source, :playlist_id
  has_one :playlist
end
