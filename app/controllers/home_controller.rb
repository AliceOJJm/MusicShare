class HomeController < ApplicationController
  def index
      @songs_tags = Song.tag_counts
      @playlists_tags = Playlist.tag_counts
      @songs = Song.all
      @genres = Genre.all
      @playlists = Playlist.all
      @ten_latest_songs = @songs.order(:created_at => :desc).limit(10).reverse
      @most_popular_users = RatingCache.order(avg: :desc).where(:cacheable_type => "User").limit(10).map(&:cacheable_id).collect{|id| User.where(id: id)}.flatten
      @most_popular_songs = RatingCache.order(avg: :desc).where(:cacheable_type => "Song").limit(10).map(&:cacheable_id).collect{|id| Song.where(id: id)}.flatten
      @most_popular_playlists = Playlist.order(likes: :desc).limit(10)
      if params[:folder]
        render json:{g_folder: params[:folder]}
      end
  end

  def change_locale
    language = params[:locale].to_s.strip.to_sym
    language = I18n.default_locale unless I18n.available_locales.include?(language)
    cookies.permanent[:locale] = language
    redirect_to request.referer || root_url
  end
end
