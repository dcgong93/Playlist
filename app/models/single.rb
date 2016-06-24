class Single < ActiveRecord::Base
  has_many :tracks
  has_many :track_users, through: :tracks, source: :user

  validates :title, :artist, :presence => true, :length => { minimum: 2 }
end
