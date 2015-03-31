class PlaylistsController < ApplicationController
  def index
    if params[:tag]
      @playlists = Playlist.tagged_with(params[:tag])
    else
      @playlists = Playlist.all
    end
  end
end
