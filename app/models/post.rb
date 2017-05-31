class Post < ApplicationRecord
  #attr_accessor :title, :body, :tag_list, :user_id
  #Uznat poshemu ne rabotaet
  acts_as_taggable
  has_many :comments, -> { order(:created_at) }
  belongs_to :user
end
