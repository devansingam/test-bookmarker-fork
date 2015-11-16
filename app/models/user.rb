class User < ActiveRecord::Base
  has_many :bookmarks
  validates :email, presence: true
  validates :password, presence: true

  def authenticate(input_password)
    if input_password == password
      return self
    else
      false
    end
  end
end
