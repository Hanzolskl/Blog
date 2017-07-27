class Post < ApplicationRecord
  require 'carrierwave/orm/activerecord'
  #attr_accessor :avatar, :title
  #Uznat poshemu ne rabotaet
  acts_as_taggable
  mount_uploader :avatar, AvatarUploader
  #after_commit :remove_avatar, on: :destroy
  has_many :comments, -> { order(:created_at) }
  belongs_to :user
end
