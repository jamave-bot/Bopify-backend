class User < ApplicationRecord
    has_secure_password
    has_many :playlists, dependent: :destroy
    has_many :songs, through: :playlists

    validates :username, uniqueness: true
end
