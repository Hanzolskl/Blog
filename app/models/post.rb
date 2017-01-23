class Post < ApplicationRecord
  has_many :comments, -> { order(:created_at) }
  belongs_to :user
end
