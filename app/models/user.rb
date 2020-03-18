class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'idUser'
  has_secure_password

  before_create do
    temp = SecureRandom.urlsafe_base64
    temp = Digest::SHA1.hexdigest temp
    self.token = temp
  end
end
