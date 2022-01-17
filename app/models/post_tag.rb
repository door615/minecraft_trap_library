class PostTag < ApplicationRecord
  #PostモデルとTagモデルの中間テーブルです
  belongs_to :post
  belongs_to :tag
end
