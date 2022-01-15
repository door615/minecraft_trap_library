class Tag < ApplicationRecord
    has_many :post_tags, dependent: :destroy
    has_many :posts, through: :post_tags

    def self.search(tag_ids)
        if tag_ids != nil 
            tag_ids.shift()
            if tag_ids.instance_of?(Integer)
                tag_ids = [].push(tag_ids)
            end
            posts = Post.find(tag_ids)
            posts.uniq!
        end
    end

end
