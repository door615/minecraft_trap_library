class Post < ApplicationRecord
    validates :title, presence: true
    validates :feature_text, presence: true
    validates :text, presence: true
end
