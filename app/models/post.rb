class Post < ApplicationRecord
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
    validates :title, presence: true
    validates :feature_text, presence: true
    mount_uploader :avatar, AvatarUploader

    #これはキーワード検索をするメソッドです
    #検索フォームから送られてきた検索ワードが、タイトルもしくは本文に含まれていたら
    #値を返します
    def self.search(keyword)
        array1 = Post.where(["title like? OR feature_text like?", "%#{keyword}%", "%#{keyword}%"])
    end


    #これはタグのAND検索をするメソッドです
    #検索フォームでタグが入力されたとき、タグをAND検索します。
    def self.tag_search(tag_ids)

            #フォームから来たタグのパラメーターが["", "1"]のように最初に空白があった
            #ので、最初の値を削除しています。(ストロングパラメーターにtag_ids: []と書いたせい？)
            tag_ids.delete_at(0)

            #OR検索の記述です。いずれ実装します
            #@tags = Post.joins(:tags).where({tags: {id: tag_ids}})

            #AND検索の記述です。正直に言うと自分ではどうしてもAND検索を実装する
            #ことが出来なかったのでコピペしました。発行されるSQLも完全に理解した
            #とは言い難いので、SQLを頑張って勉強したらここに戻ってこようと思います
            array2 = Post.joins(:post_tags).where(id: PostTag.select(:post_id)
            .where(tag_id: tag_ids)
            .group(:post_id)
            .having("COUNT(DISTINCT post_tags.tag_id) = ?", tag_ids.size)
        ).uniq
            
        
    end
end
