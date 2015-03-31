class Playlist < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :songs
  acts_as_taggable
end
