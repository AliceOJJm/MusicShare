class PlaylistsController < ApplicationController
  respond_to :html, :json

  def edit
      @playlist = Playlist.find(params[:id])
      if params[:song_id]
        @playlist.songs << Song.find(params[:song_id])
        render json: {song_id: params[:song_id]}
      end
      @songs = User.find_by_id(params[:user_id]).songs.where.not(id: @playlist.songs.map{|song| song.id})
  end

    def show
      @playlist = Playlist.find(params[:id])
      if params[:song_id]
        @playlist.songs.delete Song.find(params[:song_id])
      end
      respond_to do |format|
        format.html {}
        format.json { render json: @playlist.songs }
      end
    end

  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update_attributes(params_to_update)
    respond_to do |format|
      format.html { respond_with(@playlist)}
      format.json { respond_with_bip(@playlist) }
    end
  end

    def index
      @user = User.find(params[:user_id])
      @playlists = User.find_by_id(current_user.id).playlists.all
    end

    def create
      self.index
      @playlist = Playlist.new
      @playlist.user_id = current_user.id
      redirect_to user_playlists_path(@playlist.user_id), notice: 'Playlist was successfully created.'
      @playlist.save!
      playlist_number = (@playlist.id + 234 )
      @playlist.title = "playlist #{playlist_number / 5}"
      @playlist.description = "No description"
      @playlist.save!
    end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    render json: {playlist_id: params[:id]}
  end

  def upvote
    @playlist = Playlist.find(params[:id])
    if (  !( current_user.liked? @playlist) || (current_user.disliked? @playlist) )
      @playlist.liked_by current_user
      @playlist.likes += 1
    elsif current_user.disliked? @playlist
      @playlist.liked_by current_user
      @playlist.likes += 1
    else
      @playlist.unliked_by current_user
      @playlist.likes -= 1
    end
    @playlist.save
    render json: { like_count: @playlist.likes, playlist_id: params[:id] }
  end

  private
  def params_to_update
    params.require(:playlist).permit!
  end

end
