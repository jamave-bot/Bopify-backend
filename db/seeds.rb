# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Playlist.destroy_all
# PlaylistSong.destroy_all
Song.destroy_all

# jmv = User.create(username: "jmv", password: "abc123")
# bob = User.create(username: "bob", password: "abc123")

# bops = Playlist.create(name: "bops", user_id: jmv.id)

# hamabe = Song.create(song_link: "https://youtu.be/sMCDxofgIyc", source: "youtube", playlist_id: bops.id)
# italianSong = Song.create(song_link: "https://open.spotify.com/track/4sm0tIOEWaftb5dtzEGCxb?si=a5a03d3e01da4671", source: "spotify", playlist_id: bops.id)

