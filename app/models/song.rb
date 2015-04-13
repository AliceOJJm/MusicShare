class Song < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  has_and_belongs_to_many :playlists
  belongs_to :genre
  has_many :marks, as: :markable
  acts_as_taggable
  mount_uploader :file, SongUploader
  ratyrate_rateable 'Rating'

  def parse_mp3
    url = URI.parse(self.file.url) # turn the string into a URI
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == "https")
    req = Net::HTTP::Get.new(url.path) # init a request with the url
    res = http.request(req) # load the mp3 file

    Mp3Info.open( StringIO.open(res.body) ) do |m|  #do the parsing
      if m.tag.artist == ""
        self.performer = "Performer"
      else
        self.performer =  m.tag.artist
      end
      if m.tag.title == ""
        self.title = "Title"
      else
        self.title = m.tag.title
      end
      genre_title = m.tag.genre_s
      genre_title ||= ""
      new_genre = Genre.find_by_title(genre_title)
      new_genre ||= Genre.create(title: genre_title)
      self.genre  =  new_genre
    end
  end

  searchable do
    text :title, :performer
    string :tag_list, multiple: true
  end
end
