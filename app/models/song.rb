class Song < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  has_and_belongs_to_many :playlists
  has_and_belongs_to_many :genres
  has_many :marks, as: :markable
end