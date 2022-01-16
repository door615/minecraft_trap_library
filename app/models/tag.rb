class Tag < ApplicationRecord
    has_many :post_tags, dependent: :destroy
    has_many :posts, through: :post_tags

    def self.search(tag_ids)

            tag_ids.delete_at(0)
            array2 = []
            tag_ids.each do |tag_id|
                array2.concat(Tag.find(tag_id).posts)
            end
            array2.uniq!
            return(array2)
        
    end

end
