class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'idUser'
  validates :content, presence: true
end
