class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def show
    @songs = User.find_by_id(current_user.id).songs.all
  end

  def index
    @songs = User.find_by_id(current_user.id).songs.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new
    @song.user_id = current_user.id
    @song.file = params[:file]

    @song.save!

    respond_to do |format|
      format.html { redirect_to songs_path(@song.user_id), notice: 'Song was successfully updated.' }
      format.json { render json: @song }
    end
  end

  # DELETE /musics/1
  # DELETE /musics/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_path(@song.user_id), notice: 'Song was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song = Song.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def song_params
    params.require(:song).permit(:user_id, :file, :title, :performer)
  end
end