class Tag < ApplicationRecord
    has_many :post_tags, dependent: :destroy
    has_many :posts, through: :post_tags


    #検索フォームでタグが入力されたとき、タグをOR検索します
    #このメソッドは同じデータを複数回データベースから取り出しているので
    #改善が必要です
    def self.search(tag_ids)

            #フォームから来たタグのパラメーターが["", "1"]のように最初に空白があった
            #ので、最初の値を削除しています。(ストロングパラメーターにtag_ids: []と書いたせい？)
            tag_ids.delete_at(0)
            array2 = []
            tag_ids.each do |tag_id|
                array2.concat(Tag.find(tag_id).posts)
            end
            array2.uniq!
            return(array2)
        
    end

end
