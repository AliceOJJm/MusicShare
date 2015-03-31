class SongsController < ApplicationController
  def show
    @songs = Song.where(:user_id => current_user.id)
  end
end
