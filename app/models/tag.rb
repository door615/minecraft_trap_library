class Tag < ApplicationRecord
    has_many :post_tags, dependent: :destroy
    has_many :posts, through: :post_tags

    def self.search(tag_ids)
        if tag_ids != nil 
            if tag_ids.instance.of?(Integer)
                tag_ids = [].push(tag_ids)
            end
            posts = []
            tag_ids.each do |tag_id|
                posts.concat(Tag.find(tag_id).posts)
            end
            posts.uniq!
        end
    end

end
