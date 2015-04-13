class SearchController < ApplicationController
  def search
    if params[:selector] == t("songs")
      @results = search_songs
    elsif params[:selector] == t("playlists")
      @results = search_playlists
    else
      @results = search_users
    end
    @request = params[:request]
  end

  def tags
    @genres = Genre.all
    if params[:tag]
      @songs = Song.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 5)
      @playlists = Playlist.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 5)
    end
  end

  def search_songs
    if params[:request].empty?
      @results = Song.all.paginate(:page => params[:page], :per_page => 5)
    else
      @search = Song.search do
        fulltext params[:request]
        paginate :page => params[:page], :per_page => 5
      end
    end
    @genres = Genre.all
    @results ||= @search.results
  end

  def search_playlists
    if params[:request].empty?
      @results = Playlist.all.paginate(:page => params[:page], :per_page => 5)
    else
      @search = Playlist.search do
        fulltext params[:request]
        #with :tag_list, ["tag1", "tag2"]
        paginate :page => params[:page], :per_page => 5
      end
    end
    @results ||= @search.results
  end

  def search_users
    if params[:request].empty?
      @results = 1
      redirect_to users_path
    else
      @search = User.search do
        fulltext params[:request]
        paginate :page => params[:page], :per_page => 5
      end
    end
    @results ||= @search.results
  end
end
