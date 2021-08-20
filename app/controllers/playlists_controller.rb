class PlaylistsController < ApplicationController
    # Any time that you make a Fetch Request involving a User AND you include the Authorization Headers, you need this line
        # You will have acces to `@user` variable from the token
    before_action :authorized, only: [:create, :destroy]
    rescue_from ActiveRecord::RecordInvalid, with: :show_errors

    def index
        render json: Playlist.all
    end

    def create
        playlist = @user.playlists.create!(playlist_params)
        render json: playlist
    end

    def destroy
        playlist = @user.playlists.find(params[:id])
        playlist.destroy
        render json: playlist
    end

    private

    def show_errors(invalid)
        render json: {errors: invalid.record.errors.full_messages}
    end

    def playlist_params
        params.permit(:name, :user_id)
    end
end
