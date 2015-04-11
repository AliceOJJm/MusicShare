class UsersController < ApplicationController
  respond_to :html, :json
  def update
  end

  def show
    @user = User.find(params[:id])
    @amount_of_songs = @user.songs.count
  end

  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 5)
  end
end
