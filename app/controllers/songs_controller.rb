class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  before_action :check_user, only: [:create, :destroy]

def check_user
  unless params[user_id] == current_user.id
    redirect_to root_path
  end
end


  def index
      if params[:id] && params[:genre_title]
        @song = Song.find(params[:id])
        new_genre = Genre.find_by_title(params[:genre_title])
        @song.genre  =  new_genre
        @song.save!
      end
      self.new
      @user = User.find(params[:user_id])
      @songs = User.find_by_id(params[:user_id]).songs.all
      @genres = Genre.all
  end

  def new
    @song = Song.new
  end

  def create
    begin
      @song = Song.create(song_params)
      @song.parse_mp3
      respond_to do |format|
        if @song.save
          format.html { redirect_to user_path(@song.user_id)}
          format.json { render json: @song }
        end
    end
  rescue
    @song.destroy
    render json:{}
  end
  end

  def update
    @song = Song.find(params[:id])
    @song.update_attributes(params_to_update)
    respond_to do |format|
      format.html { respond_with(@song)}
      format.json { respond_with_bip(@song) }
    end
  end

  def copy
    @song = Song.find(params[:id])
    @song_new = Song.new(title: @song.title, performer: @song.performer, user_id: current_user.id, remote_file_url: @song.file.url.to_s)
    @song_new.genre = @song.genre
    @song_new.tag_list = @song.tag_list
    @song_new.save
    render json: {song_id: params[:id]}
  end

  def destroy
    @song.destroy
    render json: {song_id: params[:id]}
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song = Song.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def params_to_update
    params.require(:song).permit!
  end

  def song_params
    params.permit(:file, :user_id, :title, :performer)
  end

end