class HomeController < ApplicationController
  def index
    if params[:tag]
      @songs = Song.tagged_with(params[:tag])
      @playlists = Playlist.tagged_with(params[:tag])
    else
      @songs = Song.all
      @playlists = Playlist.all
    end
  end
end
