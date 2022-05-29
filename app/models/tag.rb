class Tag < ApplicationRecord

    #タグを取り出すときは.order(:priority_number)をつける
    has_many :post_tags, dependent: :destroy
    has_many :posts, through: :post_tags

end
