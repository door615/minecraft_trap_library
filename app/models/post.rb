class Post < ApplicationRecord
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
    validates :title, presence: true
    validates :feature_text, presence: true
    mount_uploader :avatar, AvatarUploader
end
