class User < ApplicationRecord
	has_secure_password
	before_create :token

	private

	def token
		temp = SecureRandom.urlsafe_base64
		temp = Digest::SHA1.hexdigest temp
		temp
	end
end
