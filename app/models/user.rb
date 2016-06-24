class User < ActiveRecord::Base
  has_secure_password

  has_many :tracks
  has_many :single_tracks, through: :tracks, source: :single

  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :email, :presence => true
  validates :email, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
end
