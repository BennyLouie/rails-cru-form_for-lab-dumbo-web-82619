class SongsController < ApplicationController

    def index
        @songs = Song.all 
    end

    def show
        @song = Song.find(params[:id])
        @genre = @song.genre
        @artist = @song.artist
    end

    def new
        @song = Song.new
    end

    def create
        song = Song.create(strong_params)
        redirect_to song_path(song)
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.update(strong_params)
        redirect_to song_path(@song)
    end

    private

    def strong_params
        params.require(:song).permit!
    end
end
