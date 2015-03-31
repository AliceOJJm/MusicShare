class SongsController < ApplicationController
  def show
    @songs = User.find_by_id(current_user.id).songs.all
  end

  def index
    @songs = User.find_by_id(current_user.id).songs.all
  end
end
