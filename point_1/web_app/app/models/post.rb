class Post < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :user
end
