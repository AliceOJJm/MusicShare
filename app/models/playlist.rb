class Playlist < ActiveRecord::Base
  belongs_to :user, touch: true
  has_and_belongs_to_many :songs, touch: true
  acts_as_taggable
  acts_as_votable

  searchable do
    text :title, :description
    string :tag_list, multiple: true
  end
end
