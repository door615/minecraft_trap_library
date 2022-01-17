class Post < ApplicationRecord
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
    validates :title, presence: true
    validates :feature_text, presence: true
    mount_uploader :avatar, AvatarUploader

    #検索フォームから送られてきた検索ワードが、タイトルもしくは本文に含まれていたら
    #値を返します
    def self.search(keyword)
        array1 = Post.where(["title like? OR feature_text like?", "%#{keyword}%", "%#{keyword}%"])
        #タグの検索結果とAND検索をしたいので配列に変換しています
        #これだとデータ数が増えたときに一気にすべてのデータを取り出しているので
        #処理速度が遅くなるので改善が必要です
        array1.to_a
    end
end
