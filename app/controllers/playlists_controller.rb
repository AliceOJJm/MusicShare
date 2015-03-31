class PlaylistsController < ApplicationController
    def show
      @playlists = User.find_by_id(current_user.id).playlists.all
    end

    def index
      @playlists = User.find_by_id(current_user.id).playlists.all
    end
end
