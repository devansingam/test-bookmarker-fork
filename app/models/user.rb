class User < ActiveRecord::Base
  has_many :bookmarks
  validates :email, presence: true
  validates :password, presence: true

  def self.authenticate(input_password)
    User.find_by(password: input_password)
  end
end
