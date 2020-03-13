class Post < ApplicationRecord
	belong_to :user, class_name: 'User', foreign_key: 'idUser'
	validates :content, presence: true
end
