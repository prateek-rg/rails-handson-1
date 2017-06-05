class Article < ApplicationRecord
	validates :title, presence: true, length: {minimum:5}, uniqueness: true
	has_many :comments, dependent: :destroy
end
