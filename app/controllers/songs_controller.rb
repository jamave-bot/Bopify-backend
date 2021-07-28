class SongsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :show_errors
    before_action :authorized, only: [:create, :destroy]

    def create
        song = Song.create!(song_params)
        render json: song
    end


    def destroy
        song = Song.find(params[:id])
        song.destroy
        render json: song
    end

    private

    def show_errors(invalid)
        render json: {errors: invalid.record.errors.full_messages}
    end

    def song_params
        params.permit(:song_link, :source, :playlist_id)
    end
end
