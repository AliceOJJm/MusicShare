class User < ActiveRecord::Base
  has_many :songs, dependent: :destroy
  has_many :playlists, dependent: :destroy
  has_many :marks, as: :markable
  has_many :own_marks, class_name: 'Mark',
           foreign_key: 'markable_id'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.save!
    end
  end
end