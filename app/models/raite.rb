class Raite < ApplicationRecord
  #validates :post_id, uniqueness: {scope: :user_id}
  #validates :value, inclusion: { in: [1, -1], message: "%{value} is not a valid vote" }
  belongs_to :user
  belongs_to :post
end
