class User < ActiveRecord::Base
  has_many :posts, foreign_key: :author_id

  validates_presence_of :username
  validates_uniqueness_of :username
  has_secure_password
end
